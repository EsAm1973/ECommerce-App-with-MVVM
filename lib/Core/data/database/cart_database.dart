import 'dart:convert';
import 'package:ecommerce_app/Core/models/productModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class CartDatabase {
  static final CartDatabase _instance = CartDatabase._internal();
  factory CartDatabase() => _instance;
  CartDatabase._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('cart.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cart_items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER,
        product_id INTEGER,
        price REAL,
        old_price REAL,
        discount REAL,
        image TEXT,
        name TEXT,
        description TEXT,
        images TEXT,
        in_favorites INTEGER,
        in_cart INTEGER,
        quantity INTEGER,
        UNIQUE(user_id, product_id)
      )
    ''');
  }
  
  // إضافة عنصر للكارت
  Future<int> insertCartItem(int userId, Product product, int quantity) async {
    final db = await database;
    final imagesJson = json.encode(product.images);
    final inFavorites = product.inFavorites ? 1 : 0;
    final inCart = product.inCart ? 1 : 0;
    final data = {
      'user_id': userId,
      'product_id': product.id,
      'price': product.price,
      'old_price': product.oldPrice,
      'discount': product.discount,
      'image': product.image,
      'name': product.name,
      'description': product.description,
      'images': imagesJson,
      'in_favorites': inFavorites,
      'in_cart': inCart,
      'quantity': quantity,
    };

    // عند حدوث تضارب (محاولة إدخال مكرر لنفس المنتج لنفس المستخدم)
    // سيتم رمي Exception حسب الـ conflictAlgorithm المحدد.
    return await db.insert('cart_items', data, conflictAlgorithm: ConflictAlgorithm.fail);
  }

  // حذف عنصر من الكارت
  Future<int> deleteCartItem(int userId, int productId) async {
    final db = await database;
    return await db.delete(
      'cart_items',
      where: 'user_id = ? AND product_id = ?',
      whereArgs: [userId, productId],
    );
  }

  // تحديث كمية عنصر في الكارت
  Future<int> updateCartItemQuantity(int userId, int productId, int quantity) async {
    final db = await database;
    return await db.update(
      'cart_items',
      {'quantity': quantity},
      where: 'user_id = ? AND product_id = ?',
      whereArgs: [userId, productId],
    );
  }

  // جلب جميع عناصر الكارت للمستخدم
  Future<List<Map<String, dynamic>>> getCartItems(int userId) async {
    final db = await database;
    return await db.query(
      'cart_items',
      where: 'user_id = ?',
      whereArgs: [userId],
    );
  }
}

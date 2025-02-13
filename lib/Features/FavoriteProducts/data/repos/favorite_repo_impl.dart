import 'dart:convert';
import 'package:ecommerce_app/Core/data/database/favorite_database.dart';
import 'package:ecommerce_app/Features/FavoriteProducts/data/repos/favorite_repo.dart';
import 'package:ecommerce_app/Core/models/productModel.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteRepositoryImpl implements IFavoriteRepository {
  final FavoriteDatabase favoriteDatabase;

  FavoriteRepositoryImpl({required this.favoriteDatabase});

  @override
  Future<void> addFavorite(Product product, int userId) async {
    final db = await favoriteDatabase.database;
    await db.insert(
      'favorite',
      {
        'productId': product.id,
        'userId': userId,
        'price': product.price,
        'oldPrice': product.oldPrice,
        'discount': product.discount,
        'image': product.image,
        'name': product.name,
        'description': product.description,
        'images': jsonEncode(product.images),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> removeFavorite(int productId, int userId) async {
    final db = await favoriteDatabase.database;
    await db.delete(
      'favorite',
      where: 'productId = ? AND userId = ?',
      whereArgs: [productId, userId],
    );
  }

  @override
  Future<List<Product>> getFavorites(int userId) async {
    final db = await favoriteDatabase.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'favorite',
      where: 'userId = ?',
      whereArgs: [userId],
    );
    return maps.map((map) {
      return Product(
        id: map['productId'],
        price: map['price'],
        oldPrice: map['oldPrice'],
        discount: map['discount'],
        image: map['image'],
        name: map['name'],
        description: map['description'],
        images: List<String>.from(jsonDecode(map['images'])),
        inFavorites: true, // Since it is stored as a favorite.
        inCart: false, // Modify as needed.
      );
    }).toList();
  }

  @override
  Future<bool> isFavorite(int productId, int userId) async {
    final db = await favoriteDatabase.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'favorite',
      where: 'productId = ? AND userId = ?',
      whereArgs: [productId, userId],
    );
    return maps.isNotEmpty;
  }
}

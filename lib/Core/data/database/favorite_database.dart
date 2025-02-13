import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FavoriteDatabase {
  static final FavoriteDatabase _instance = FavoriteDatabase._internal();
  static Database? _database;

  FavoriteDatabase._internal();

  factory FavoriteDatabase() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'favorite.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE favorite(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            productId INTEGER,
            userId INTEGER,
            price REAL,
            oldPrice REAL,
            discount REAL,
            image TEXT,
            name TEXT,
            description TEXT,
            images TEXT
          )
        ''');
      },
    );
  }
}

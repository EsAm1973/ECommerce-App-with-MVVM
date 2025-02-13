// user_repository_impl.dart
import 'package:ecommerce_app/Core/data/database/user_database.dart';
import 'package:ecommerce_app/Core/models/user_model.dart';
import 'package:ecommerce_app/Core/data/repositories/user_database_repo.dart';
import 'package:sqflite/sqflite.dart';

class UserRepositoryImpl implements IUserRepository {
  final UserDatabase userDatabase;

  UserRepositoryImpl({required this.userDatabase});

  @override
  Future<void> saveUser(User user) async {
    final db = await userDatabase.database;
    await db.insert(
      'user',
      {
        'id': user.id,
        'name': user.name,
        'email': user.email,
        'phone': user.phone,
        'token': user.token,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<User?> getUser() async {
    final db = await userDatabase.database;
    List<Map<String, dynamic>> maps = await db.query('user', limit: 1);
    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    }
    return null;
  }
}

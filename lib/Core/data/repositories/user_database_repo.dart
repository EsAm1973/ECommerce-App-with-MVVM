import 'package:ecommerce_app/Core/models/user_model.dart';

abstract class IUserRepository {
  Future<void> saveUser(User user);
  Future<User?> getUser();
}

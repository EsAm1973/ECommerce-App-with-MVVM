import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Core/errors/failure.dart';

abstract class RegisterRepo {
  Future<Either<Failure, Map<String, dynamic>>> register({
    required String name,
    required String phone,
    required String email,
    required String password,
    String? image,
  });
}
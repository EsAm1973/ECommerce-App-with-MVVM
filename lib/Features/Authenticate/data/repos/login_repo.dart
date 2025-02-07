import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Core/errors/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, Map<String, dynamic>>> login(
      {required String email, required String password});
}



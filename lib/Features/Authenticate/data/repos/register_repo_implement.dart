import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/Core/errors/failure.dart';
import 'package:ecommerce_app/Core/utils/api_service.dart';
import 'package:ecommerce_app/Features/Authenticate/data/repos/auth_repo.dart';

class RegisterRepoImplement implements RegisterRepo {
  final ApiService apiService;
  RegisterRepoImplement({required this.apiService});
  @override
  Future<Either<Failure, Map<String, dynamic>>> register(
      {required String name,
      required String phone,
      required String email,
      required String password,
      String? image}) async {
    final body = {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'image': image
    };
    final headers = {
      'Content-Type': 'application/json',
      'lang': 'en',
    };
    try {
      final response =
          await apiService.post('register', body, headers: headers);
      return right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}

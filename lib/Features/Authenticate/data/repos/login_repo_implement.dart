import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/Core/errors/failure.dart';
import 'package:ecommerce_app/Core/utils/api_service.dart';
import 'package:ecommerce_app/Features/Authenticate/data/repos/login_repo.dart';

class LoginRepoImplement implements LoginRepo {
  final ApiService apiService;

  LoginRepoImplement({required this.apiService});
  @override
  Future<Either<Failure, Map<String, dynamic>>> login(
      {required String email, required String password}) async {
    final body = {
      'email': email,
      'password': password,
    };
    final headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
    };
    try {
      final response = await apiService.post('login', body, headers: headers);
      if (response['status'] == false) {
        return left(
          ServerFailure(
            errorMessage: response['message'],
          ),
        );
      } else {
        return right(response);
      }
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}

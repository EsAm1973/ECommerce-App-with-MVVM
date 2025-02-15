import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/Core/errors/failure.dart';
import 'package:ecommerce_app/Core/utils/api_service.dart';
import 'package:ecommerce_app/Features/home/data/models/categorydart';
import 'package:ecommerce_app/Features/home/data/repos/category_repo.dart';

class FetchCategoryRepoImpl implements FetchCategoryRepo {
  final ApiService apiService;

  FetchCategoryRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<Category>>> fetchCategories() async {
    final headers = {'lang': 'en'};
    try {
      final response = await apiService.get(
        'https://student.valuxapps.com/api/categories',
        headers: headers,
      );

      if (response is! Map<String, dynamic> || response['status'] == null) {
        return left(ServerFailure(errorMessage: 'Invalid response format'));
      }

      if (response['status'] == false) {
        final message = response['message']?.toString() ?? 'Unknown error';
        return left(ServerFailure(errorMessage: message));
      }

      final data = response['data'] as Map<String, dynamic>?;
      final categoriesData = data?['data'] as List<dynamic>?;

      if (categoriesData == null) {
        return left(ServerFailure(errorMessage: 'No categories found'));
      }

      try {
        final categories = categoriesData
            .map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList();
        return right(categories);
      } catch (e) {
        return left(ServerFailure(errorMessage: 'Failed to parse categories: $e'));
      }
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: 'Unexpected error: $e'));
    }
  }
}
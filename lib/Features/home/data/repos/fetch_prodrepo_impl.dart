import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/Core/errors/failure.dart';
import 'package:ecommerce_app/Core/utils/api_service.dart';
import 'package:ecommerce_app/Core/models/productModel.dart';
import 'package:ecommerce_app/Features/home/data/repos/fetch_prod_repo.dart';

class FetchProductRepoImpl implements FetchProductRepo {
  final ApiService apiService;
  FetchProductRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<Product>>> fetchProducts() async {
    final headers = {'lang': 'en'};
    try {
      final response = await apiService
          .get('https://student.valuxapps.com/api/products', headers: headers);
      print(response);

      // Validate response structure
      if (response is! Map<String, dynamic> || response['status'] == null) {
        return left(ServerFailure(errorMessage: 'Invalid response format'));
      }

      if (response['status'] == false) {
        final message =
            response['message']?.toString() ?? 'Unknown server error';
        return left(ServerFailure(errorMessage: message));
      }

      // Validate and parse data
      final data = response['data'] as Map<String, dynamic>?;
      final productsList = data?['data'] as List<dynamic>?;

      if (productsList == null) {
        return left(ServerFailure(errorMessage: 'No products found'));
      }

      try {
        final products = productsList
            .map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList();
        return right(products);
      } catch (e) {
        return left(
            ServerFailure(errorMessage: 'Failed to parse products: $e'));
      }
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(
          ServerFailure(errorMessage: 'Unexpected error: ${e.toString()}'));
    }
  }
}

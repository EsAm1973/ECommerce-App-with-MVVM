import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/Core/errors/failure.dart';
import 'package:ecommerce_app/Core/utils/api_service.dart';
import 'package:ecommerce_app/Features/home/data/models/productModel.dart';
import 'package:ecommerce_app/Features/home/data/repos/fetch_prod_repo.dart';

class FetchProductRepoImpl implements FetchProductRepo{

  final ApiService apiService;
  FetchProductRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<Product>>> fetchProducts() async {
    try {
      final response = await apiService.get('products');
      return right(response['data'].map((e) => Product.fromJson(e)).toList());
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

}
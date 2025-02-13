import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Core/errors/failure.dart';
import 'package:ecommerce_app/Core/models/productModel.dart';

abstract class FetchProductRepo {
  Future<Either<Failure, List<Product>>> fetchProducts();
}
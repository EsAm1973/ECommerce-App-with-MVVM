import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Core/errors/failure.dart';
import 'package:ecommerce_app/Features/home/data/models/category.dart';

abstract class FetchCategoryRepo {
  Future<Either<Failure, List<Category>>> fetchCategories();
}
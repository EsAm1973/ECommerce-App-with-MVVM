import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/Features/home/data/models/category.dart';
import 'package:ecommerce_app/Features/home/data/repos/category_repo.dart';
import 'package:equatable/equatable.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final FetchCategoryRepo fetchCategoryRepo;

  CategoryCubit(this.fetchCategoryRepo) : super(CategoryInitial());

  Future<void> fetchCategories() async {
    emit(CategoryLoading());
    final result = await fetchCategoryRepo.fetchCategories();
    result.fold(
      (failure) => emit(CategoryFailure(errorMessage: failure.errorMessage)),
      (categories) => emit(CategorySuccess(categories: categories)),
    );
  }
}

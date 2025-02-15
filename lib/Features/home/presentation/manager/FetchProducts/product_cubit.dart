import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/Core/models/productModel.dart';
import 'package:ecommerce_app/Features/home/data/repos/fetch_prod_repo.dart';
import 'package:equatable/equatable.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.fetchProductRepo) : super(ProductInitial());
  final FetchProductRepo fetchProductRepo;
  int? selectedCategoryId;

  void selectCategory(int categoryId) {
    selectedCategoryId = categoryId;
  }

  Future<void> fetchProducts({int? categoryId}) async {
    emit(ProductLoading());
    final result = await fetchProductRepo.fetchProducts(categoryId: categoryId);
    result.fold(
      (failure) => emit(ProductFailure(errorMessage: failure.errorMessage)),
      (products) => emit(
        ProductSuccess(products: products),
      ),
    );
  }
}

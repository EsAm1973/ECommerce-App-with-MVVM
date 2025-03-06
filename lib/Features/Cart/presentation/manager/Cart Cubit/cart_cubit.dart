import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/Core/errors/database_failure.dart';
import 'package:ecommerce_app/Core/models/productModel.dart';
import 'package:ecommerce_app/Features/Cart/data/models/cart_item.dart';
import 'package:ecommerce_app/Features/Cart/data/repos/cart_repo.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
  final CartRepo cartRepo;

  Future<void> loadCart(int userId) async {
    emit(CartLoading());
    try {
      final cartItems = await cartRepo.getCartItems(userId);
      emit(CartSuccess(cartItems: cartItems));
    } catch (e) {
      emit(CartFailure(errorMessage: e.toString()));
    }
  }

  Future<void> addProduct(int userId, Product product) async {
    try {
      await cartRepo.addToCart(userId, product);
      await loadCart(userId);
    } on DuplicateProductException {
      // حالة متوقعة: المنتج موجود بالفعل
      await loadCart(userId); // نحدث بيانات الكارت حتى لو كان مكرر
      rethrow; // إعادة رمي الاستثناء ليقوم الـ UI بعرض الـ Snackbar المناسب
    } catch (e) {
      // أخطاء جدية أخرى
      emit(CartFailure(errorMessage: e.toString()));
    }
  }

  Future<void> removeFromCart(int userId, int productId) async {
    emit(CartLoading());
    try {
      await cartRepo.removeFromCart(userId, productId);
      await loadCart(userId);
    } catch (e) {
      emit(CartFailure(errorMessage: e.toString()));
    }
  }

  Future<void> updateCartItemQuantity(
      int userId, int productId, int quantity) async {
    try {
      if (quantity < 1) return; // لتجنب الكمية اقل من 1
      await cartRepo.updateCartItemQuantity(userId, productId, quantity);
      await loadCart(userId);
    } catch (e) {
      emit(CartFailure(errorMessage: e.toString()));
    }
  }
}

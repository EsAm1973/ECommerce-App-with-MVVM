import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/Core/models/productModel.dart';
import 'package:ecommerce_app/Features/Cart/data/models/cart_item.dart';
import 'package:ecommerce_app/Features/Cart/data/repos/cart_repo.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo, this.userId) : super(CartInitial());
  final CartRepo cartRepo;
  final int userId;

  Future<void> loadCart() async {
    emit(CartLoading());
    try {
      final cartItems = await cartRepo.getCartItems(userId);
      emit(CartSuccess(cartItems: cartItems));
    } catch (e) {
      emit(CartFailure(errorMessage: e.toString()));
    }
  }

  Future<void> addProduct(Product product) async {
    emit(CartLoading());
    try {
      await cartRepo.addToCart(userId, product);
      await loadCart();
    } catch (e) {
      emit(CartFailure(errorMessage: e.toString()));
    }
  }

  Future<void> removeFromCart(int productId) async {
    emit(CartLoading());
    try {
      await cartRepo.removeFromCart(userId, productId);
      await loadCart();
    } catch (e) {
      emit(CartFailure(errorMessage: e.toString()));
    }
  }

  Future<void> updateCartItemQuantity(int productId, int quantity) async {
    try {
      if (quantity < 1) return; // لتجنب الكمية اقل من 1
      await cartRepo.updateCartItemQuantity(userId, productId, quantity);
      await loadCart();
    } catch (e) {
      emit(CartFailure(errorMessage: e.toString()));
    }
  }
}

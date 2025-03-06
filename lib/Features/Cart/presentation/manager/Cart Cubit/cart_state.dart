part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {
  final List<CartItem> cartItems;
  // خريطة تختزن حالة الاختيار لكل منتج: true إذا تم اختياره، false خلاف ذلك
  final Map<int, bool> selectedItems;
  const CartSuccess({
    required this.cartItems,
    required this.selectedItems,
  });
  @override
  List<Object> get props => [cartItems, selectedItems];
}

final class CartFailure extends CartState {
  final String errorMessage;
  const CartFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

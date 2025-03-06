import 'package:ecommerce_app/Core/data/UserCubit/user_cubit.dart';
import 'package:ecommerce_app/Features/Cart/presentation/manager/Cart%20Cubit/cart_cubit.dart';
import 'package:ecommerce_app/Features/Cart/presentation/views/widgets/cart_checkout_button.dart';
import 'package:ecommerce_app/Features/Cart/presentation/views/widgets/cart_listview.dart';
import 'package:ecommerce_app/Features/Cart/presentation/views/widgets/cart_select_all.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  late int userId;

  @override
  void initState() {
    super.initState();
    userId = context.read<UserCubit>().currentUser!.id;
    // تحميل بيانات الـ cart عند بدء الشاشة
    context.read<CartCubit>().loadCart(userId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CartSuccess) {
          // تحديد حالة select all بناءً على حالة كل عنصر في الخريطة
          bool selectAll = state.selectedItems.isNotEmpty &&
              state.selectedItems.values.every((v) => v);

          // حساب السعر الكلي للعناصر المختارة فقط
          double totalPrice = 0;
          for (var item in state.cartItems) {
            if (state.selectedItems[item.product.id] == true) {
              totalPrice += item.product.price * item.quantity;
            }
          }
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                  bottom: 90, // مساحة كافية للزر
                ),
                child: Column(
                  children: [
                    CartSelectAll(
                      isChecked: selectAll,
                      onChanged: (value) => context
                          .read<CartCubit>()
                          .toggleSelectAll(value ?? false),
                      onRemove: () =>
                          context.read<CartCubit>().removeSelectedItems(userId),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: CartItemsListView(
                        cartItems: state.cartItems,
                        selectedItems: state.selectedItems,
                        onItemChecked: (productId) => context
                            .read<CartCubit>()
                            .toggleItemSelection(productId),
                        onQuantityChanged:
                            (productId, isIncrement, currentQuantity) {
                          int newQuantity =
                              currentQuantity + (isIncrement ? 1 : -1);
                          if (newQuantity < 1) return;
                          context.read<CartCubit>().updateCartItemQuantity(
                              userId, productId, newQuantity);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // زر Checkout ثابت في أسفل الشاشة
              CheckoutButton(totalPrice: totalPrice),
            ],
          );
        } else if (state is CartFailure) {
          return Center(child: Text(state.errorMessage));
        }
        return const SizedBox();
      },
    );
  }
}

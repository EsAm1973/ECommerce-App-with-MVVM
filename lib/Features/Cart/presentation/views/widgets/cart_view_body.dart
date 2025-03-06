import 'package:ecommerce_app/Core/data/UserCubit/user_cubit.dart';
import 'package:ecommerce_app/Features/Cart/data/models/cart_item.dart';
import 'package:ecommerce_app/Features/Cart/presentation/manager/Cart%20Cubit/cart_cubit.dart';
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
  /// تتبع حالة اختيار المنتجات باستخدام الـ product id كمفتاح
  final Map<int, bool> _selectedItems = {};
  late int userId;
  @override
  void initState() {
    super.initState();
    userId = context.read<UserCubit>().currentUser!.id;
    // تحميل بيانات الـ cart عند بدء الشاشة
    context.read<CartCubit>().loadCart(userId);
  }

  /// دالة لتحديث حالة اختيار الكل
  void toggleSelectAll(bool? value, List<CartItem> items) {
    setState(() {
      bool newValue = value ?? false;
      for (var item in items) {
        _selectedItems[item.product.id] = newValue;
      }
    });
  }

  /// دالة لتبديل اختيار منتج معين (باستخدام product id)
  void toggleItemSelection(int productId) {
    setState(() {
      _selectedItems[productId] = !(_selectedItems[productId] ?? false);
    });
  }

  /// دالة لتحديث الكمية عبر استدعاء cubit
  void changeItemQuantity(
      int productId, bool isIncrement, int currentQuantity) {
    final cartCubit = context.read<CartCubit>();
    int newQuantity = currentQuantity + (isIncrement ? 1 : -1);
    if (newQuantity < 1) return; // لا يسمح بأن تكون الكمية أقل من 1
    cartCubit.updateCartItemQuantity(userId, productId, newQuantity);
  }

  /// دالة لحذف المنتجات المختارة باستخدام cubit
  void removeSelectedItems(List<CartItem> items) {
    final cartCubit = context.read<CartCubit>();
    for (var item in items) {
      if (_selectedItems[item.product.id] == true) {
        cartCubit.removeFromCart(userId, item.product.id);
      }
    }
    setState(() {
      _selectedItems.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CartSuccess) {
          // عند استلام بيانات جديدة، نقوم بتحديث خريطة الاختيارات للمنتجات الجديدة
          for (var item in state.cartItems) {
            if (!_selectedItems.containsKey(item.product.id)) {
              _selectedItems[item.product.id] = false;
            }
          }
          // تحديد حالة selectAll بناءً على حالة جميع العناصر
          bool selectAll = _selectedItems.isNotEmpty &&
              _selectedItems.values.every((v) => v);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                CartSelectAll(
                  isChecked: selectAll,
                  onChanged: (value) => toggleSelectAll(value, state.cartItems),
                  onRemove: () => removeSelectedItems(state.cartItems),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: CartItemsListView(
                    cartItems: state.cartItems,
                    selectedItems: _selectedItems,
                    onItemChecked: (productId) =>
                        toggleItemSelection(productId),
                    onQuantityChanged:
                        (productId, isIncrement, currentQuantity) =>
                            changeItemQuantity(
                                productId, isIncrement, currentQuantity),
                  ),
                ),
              ],
            ),
          );
        } else if (state is CartFailure) {
          return Center(child: Text(state.errorMessage));
        }
        return Container();
      },
    );
  }
}

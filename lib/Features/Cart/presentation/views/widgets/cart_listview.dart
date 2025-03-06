import 'package:ecommerce_app/Features/Cart/data/models/cart_item.dart';
import 'package:ecommerce_app/Features/Cart/presentation/views/widgets/cart_item_tile.dart';
import 'package:flutter/material.dart';

class CartItemsListView extends StatelessWidget {
  final List<CartItem> cartItems;
  final Map<int, bool> selectedItems;
  final ValueChanged<int> onItemChecked;
  final void Function(int productId, bool isIncrement, int currentQuantity)
      onQuantityChanged;

  const CartItemsListView({
    super.key,
    required this.cartItems,
    required this.selectedItems,
    required this.onItemChecked,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //لحفاظ على الموقع الحالي فى حالة الحذف
      key: const PageStorageKey<String>('cart_list'),
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final cartItem = cartItems[index];
        bool isChecked = selectedItems[cartItem.product.id] ?? false;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CartItemTile(
                product: cartItem.product,
                quantity: cartItem.quantity,
                isChecked: isChecked,
                onChanged: (value) => onItemChecked(cartItem.product.id),
                onQuantityChanged: (isIncrement) => onQuantityChanged(
                    cartItem.product.id, isIncrement, cartItem.quantity),
              ),
            ),
            const Divider(),
          ],
        );
      },
    );
  }
}

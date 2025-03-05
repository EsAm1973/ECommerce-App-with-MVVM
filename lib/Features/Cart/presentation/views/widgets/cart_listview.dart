import 'package:ecommerce_app/Features/Cart/presentation/views/widgets/cart_item_tile.dart';
import 'package:flutter/material.dart';

class CartItemsListView extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  final ValueChanged<int> onItemChecked;
  final void Function(int, bool) onQuantityChanged;

  const CartItemsListView({
    super.key,
    required this.cartItems,
    required this.onItemChecked,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            CartItemTile(
              name: cartItems[index]['name'],
              imageUrl: cartItems[index]['imageUrl'],
              price: cartItems[index]['price'],
              quantity: cartItems[index]['quantity'],
              isChecked: cartItems[index]['isChecked'],
              onChanged: (value) => onItemChecked(index),
              onQuantityChanged: (isIncrement) =>
                  onQuantityChanged(index, isIncrement),
            ),
            const Divider(),
          ],
        );
      },
    );
  }
}

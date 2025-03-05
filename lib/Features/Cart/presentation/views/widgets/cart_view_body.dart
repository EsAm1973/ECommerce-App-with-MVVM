import 'package:ecommerce_app/Features/Cart/presentation/views/widgets/cart_listview.dart';
import 'package:ecommerce_app/Features/Cart/presentation/views/widgets/cart_select_all.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  bool selectAll = false;

  List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Nintendo Switch Lite, Yellow',
      'imageUrl':
          'https://student.valuxapps.com/storage/uploads/products/161545152160GOl.item_XXL_39275650_152762070.jpeg',
      'price': '£109.00',
      'quantity': 1,
      'isChecked': false,
    },
    {
      'name': 'The Legend of Zelda: Tears of the Kingdom',
      'imageUrl':
          'https://student.valuxapps.com/storage/uploads/products/161545152160GOl.item_XXL_39275650_152762070.jpeg',
      'price': '£39.00',
      'quantity': 1,
      'isChecked': false,
    },
  ];

  void toggleSelectAll(bool? value) {
    setState(() {
      selectAll = value ?? false;
      for (var item in cartItems) {
        item['isChecked'] = selectAll;
      }
    });
  }

  void toggleItemSelection(int index) {
    setState(() {
      cartItems[index]['isChecked'] = !cartItems[index]['isChecked'];
      selectAll = cartItems.every((item) => item['isChecked']);
    });
  }

  void changeItemQuantity(int index, bool isIncrement) {
    setState(() {
      if (isIncrement) {
        cartItems[index]['quantity']++;
      } else {
        if (cartItems[index]['quantity'] > 1) {
          cartItems[index]['quantity']--;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CartSelectAll(
            isChecked: selectAll,
            onChanged: toggleSelectAll,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: CartItemsListView(
              cartItems: cartItems,
              onItemChecked: toggleItemSelection,
              onQuantityChanged: changeItemQuantity,
            ),
          ),
        ],
      ),
    );
  }
}

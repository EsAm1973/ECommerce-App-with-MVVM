import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Features/Cart/presentation/views/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        titleTextStyle: Styles.textStyle30.copyWith(letterSpacing: 1.5),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
      ),
      body: const CartViewBody(),
    ));
  }
}

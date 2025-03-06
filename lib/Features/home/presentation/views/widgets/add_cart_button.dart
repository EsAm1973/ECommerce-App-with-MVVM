import 'package:ecommerce_app/Core/data/UserCubit/user_cubit.dart';
import 'package:ecommerce_app/Core/models/productModel.dart';
import 'package:ecommerce_app/Core/widgets/custom_button.dart';
import 'package:ecommerce_app/Features/Cart/presentation/manager/Cart%20Cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddCartButton extends StatelessWidget {
  const AddCartButton({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return CustomIconTextButton(
      onPressed: () async {
        try {
          await context.read<CartCubit>().addProduct(
                context.read<UserCubit>().currentUser!.id,
                product,
              );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Product added to cart')),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Product Already in cart')),
          );
        }
      },
      text: 'Add to Cart',
      icon: FontAwesomeIcons.cartShopping,
    );
  }
}

import 'package:ecommerce_app/Core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddCartButton extends StatelessWidget {
  const AddCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomIconTextButton(
      onPressed: () {},
      text: 'Add to Cart',
      icon: FontAwesomeIcons.cartShopping,
    );
  }
}

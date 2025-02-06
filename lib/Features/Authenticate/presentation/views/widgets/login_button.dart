import 'package:ecommerce_app/Core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomIconTextButton(
      text: 'Sign In',
      icon: Icons.arrow_forward_rounded,
      onPressed: () {},
    );
  }
}

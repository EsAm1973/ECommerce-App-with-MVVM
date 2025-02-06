import 'package:ecommerce_app/Core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key, required this.onPressed});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomIconTextButton(
      text: 'Sign In',
      icon: Icons.arrow_forward_rounded,
      onPressed: onPressed,
    );
  }
}

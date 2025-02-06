import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Core/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

class SignUpPasswordTextFeild extends StatefulWidget {
  const SignUpPasswordTextFeild({super.key, required this.passwordController});
  final TextEditingController passwordController;

  @override
  State<SignUpPasswordTextFeild> createState() =>
      _SignUpPasswordTextFeildState();
}

class _SignUpPasswordTextFeildState extends State<SignUpPasswordTextFeild> {
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomTextField(
          controller: widget.passwordController,
          hintText: 'Enter your password',
          prefixIcon: const Icon(Icons.lock_outline_rounded),
          obscureText: _obscurePassword,
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
          onChanged: (value) {},
        ),
      ],
    );
  }
}

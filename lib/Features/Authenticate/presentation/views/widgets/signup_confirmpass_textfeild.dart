import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Core/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

class SignUpConfirmationPass extends StatefulWidget {
  const SignUpConfirmationPass(
      {super.key,
      required this.passwordController,
      required this.passwordConfirmController});
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmController;
  @override
  State<SignUpConfirmationPass> createState() => _SignUpConfirmationPassState();
}

class _SignUpConfirmationPassState extends State<SignUpConfirmationPass> {
  bool _obscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Confirmation Password',
        style: Styles.textStyle14.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      CustomTextField(
        controller: widget.passwordConfirmController,
        hintText: 'Confirm your password',
        prefixIcon: const Icon(Icons.lock_outline_rounded),
        obscureText: _obscureConfirmPassword,
        suffixIcon: IconButton(
          icon: Icon(
            _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscureConfirmPassword = !_obscureConfirmPassword;
            });
          },
        ),
        validator: (value) {
          if (value != widget.passwordController.text) {
            return 'Passwords do not match';
          }
          return null;
        },
        onChanged: (value) {},
      ),
    ]);
  }
}

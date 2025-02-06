import 'package:ecommerce_app/Core/utils/app_router.dart';
import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupTextAndForgetPassword extends StatelessWidget {
  const SignupTextAndForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style: Styles.textStyle14.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton(
              child: Text(
                'Sign Up',
                style: Styles.textStyle14.copyWith(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRouter.kSignupView);
              },
            ),
          ],
        ),
        TextButton(
          child: Text(
            'Forgot Password?',
            style: Styles.textStyle16.copyWith(
              color: Colors.red,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

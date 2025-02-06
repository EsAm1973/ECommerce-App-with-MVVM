import 'package:ecommerce_app/Core/utils/app_router.dart';
import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpMoveToLogin extends StatelessWidget {
  const SignUpMoveToLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          child: Text(
            'Sign In',
            style: Styles.textStyle14.copyWith(
              color: Colors.red,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
          onPressed: () {
            GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
          },
        ),
      ],
    );
  }
}

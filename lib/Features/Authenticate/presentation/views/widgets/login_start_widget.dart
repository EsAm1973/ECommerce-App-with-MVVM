import 'package:ecommerce_app/Core/utils/assets.dart';
import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class LoginScreenStartWidget extends StatelessWidget {
  const LoginScreenStartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(AssetsPath.logo),
            fit: BoxFit.contain,
          )),
        ),
        const Text(
          'Let\'s Sign In',
          style: Styles.textStyle30,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Find All Products You Need Here',
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

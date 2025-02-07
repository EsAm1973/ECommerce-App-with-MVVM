import 'package:ecommerce_app/Core/utils/assets.dart';
import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class LoginScreenStartWidget extends StatelessWidget {
  const LoginScreenStartWidget(
      {super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(AssetsPath.logo),
            fit: BoxFit.contain,
          )),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: Styles.textStyle30,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          subtitle,
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

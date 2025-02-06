import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Core/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

class SignUpEmailAddressTextFeild extends StatelessWidget {
  const SignUpEmailAddressTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email Address',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const CustomTextField(
          hintText: 'Enter your email address',
          prefixIcon: Icon(Icons.email_outlined),
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}

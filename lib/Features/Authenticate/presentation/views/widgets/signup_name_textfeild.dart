import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Core/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

class SignUpNameTextFeild extends StatelessWidget {
  const SignUpNameTextFeild({super.key, required this.nameController});
  final TextEditingController nameController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Name',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomTextField(
          controller: nameController,
          hintText: 'Enter your First and Last name',
          prefixIcon: const Icon(Icons.person_2_outlined),
          keyboardType: TextInputType.name,
          onChanged: (value) {},
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Name';
            }
            final nameRegExp = RegExp(r"^[a-zA-Z]+(?:[\s'-][a-zA-Z]+)*$");
            if (!nameRegExp.hasMatch(value)) {
              return 'Please enter a valid name (only letters, spaces, hyphens, and apostrophes are allowed)';
            }
            return null;
          },
        ),
      ],
    );
  }
}

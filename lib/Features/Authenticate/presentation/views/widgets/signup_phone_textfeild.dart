import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Core/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

class SignUpPhoneTextFeild extends StatelessWidget {
  const SignUpPhoneTextFeild({super.key, required this.phoneNumberController});
  final TextEditingController phoneNumberController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone Number',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomTextField(
          controller: phoneNumberController,
          hintText: 'Enter your phone number',
          prefixIcon: const Icon(Icons.person_2_outlined),
          keyboardType: TextInputType.phone,
          onChanged: (value) {},
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your phone number';
            }
            final phoneRegExp = RegExp(r'^[0-9]+$');
            if (!phoneRegExp.hasMatch(value)) {
              return 'Please enter a valid phone number (only digits are allowed)';
            }
            if (value.length != 10) {
              return 'Phone number must be 10 digits long';
            }
            return null;
          },
        ),
      ],
    );
  }
}

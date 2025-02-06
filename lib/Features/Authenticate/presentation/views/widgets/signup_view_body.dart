import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/login&sign_start_widget.dart';
import 'package:flutter/material.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(
          child: LoginAndSignScreenStartWidget(
            title: 'Sign Up For Free',
            subtitle: 'Join us for less than 1 minute, with no cost',
          ),
        ),
      ],
    );
  }
}

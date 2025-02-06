import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/login_start_widget.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(child: LoginScreenStartWidget()),
      ],
    );
  }
}


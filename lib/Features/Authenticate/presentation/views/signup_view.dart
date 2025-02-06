import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SignupViewBody(),
      ),
    );
  }
}

import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/login_button.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/login_email_textfeild.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/login_password_textfeild.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/login_start_widget.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          Center(child: LoginScreenStartWidget()),
          SizedBox(
            height: 40,
          ),
          EmailAddressTextFeild(),
          SizedBox(
            height: 25,
          ),
          PasswordTextFeild(),
          SizedBox(
            height: 25,
          ),
          LoginButton(),
        ],
      ),
    );
  }
}
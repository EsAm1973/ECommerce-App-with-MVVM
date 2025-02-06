import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/login_button.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/login_email_textfeild.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/login_password_textfeild.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/login_signp&forgetpassword.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/login_socialmedia_row.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/login&sign_start_widget.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          children: [
            const Center(
                child: LoginAndSignScreenStartWidget(
              title: 'Let\'s Sign In',
              subtitle: 'Find All Products You Need Here',
            )),
            const SizedBox(
              height: 40,
            ),
            const EmailAddressTextFeild(),
            const SizedBox(
              height: 25,
            ),
            PasswordTextFeild(),
            const SizedBox(
              height: 25,
            ),
            const LoginButton(),
            const SizedBox(
              height: 40,
            ),
            const SocialMediaIconsRow(),
            const SizedBox(
              height: 40,
            ),
            const SignupTextAndForgetPassword(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

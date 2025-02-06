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
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          children: [
            Center(
                child: LoginAndSignScreenStartWidget(
              title: 'Let\'s Sign In',
              subtitle: 'Find All Products You Need Here',
            )),
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
            SizedBox(
              height: 40,
            ),
            SocialMediaIconsRow(),
            SizedBox(
              height: 40,
            ),
            SignupTextAndForgetPassword(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

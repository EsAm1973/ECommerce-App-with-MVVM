import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/login&sign_start_widget.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/signup_button.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/signup_confirmpass_textfeild.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/signup_email_textfeild.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/signup_move_to_login.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/signup_password_textfeild.dart';
import 'package:flutter/material.dart';

class SignupViewBody extends StatelessWidget {
  SignupViewBody({super.key});
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Center(
                child: LoginAndSignScreenStartWidget(
                  title: 'Sign Up For Free',
                  subtitle: 'Join us for less than 1 minute, with no cost',
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const SignUpEmailAddressTextFeild(),
              const SizedBox(
                height: 25,
              ),
              SignUpPasswordTextFeild(
                passwordController: passwordController,
              ),
              const SizedBox(
                height: 25,
              ),
              SignUpConfirmationPass(
                passwordController: passwordController,
                passwordConfirmController: passwordConfirmController,
              ),
              const SizedBox(
                height: 25,
              ),
              SignUpButton(
                onPressed: () {},
              ),
              const SizedBox(
                height: 40,
              ),
              const SignUpMoveToLogin(),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

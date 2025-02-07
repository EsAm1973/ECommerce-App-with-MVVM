import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/signup_button.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/signup_confirmpass_textfeild.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/signup_email_textfeild.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/signup_move_to_login.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/signup_name_textfeild.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/signup_password_textfeild.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/signup_phone_textfeild.dart';
import 'package:flutter/material.dart';

class SignupViewBody extends StatelessWidget {
  SignupViewBody({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
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
              Center(
                  child: Column(
                children: [
                  const Text(
                    'Sign Up For Free',
                    style: Styles.textStyle30,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Join us for less than 1 minute, with no cost',
                    style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              )),
              const SizedBox(
                height: 40,
              ),
              SignUpNameTextFeild(
                nameController: nameController,
              ),
              const SizedBox(
                height: 25,
              ),
              SignUpEmailAddressTextFeild(
                emailController: emailController,
              ),
              const SizedBox(
                height: 25,
              ),
              SignUpPhoneTextFeild(
                phoneNumberController: phoneNumberController,
              ),
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
                onPressed: () => signUp(context),
              ),
              const SizedBox(
                height: 20,
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

  void signUp(BuildContext context) {
    if (formKey.currentState!.validate()) {
      // Form is valid, proceed with sign-up logic
      final String email = emailController
          .text; // Replace with actual email from your email field
      final String password = passwordController.text;
      final String confirmPassword = passwordConfirmController.text;

      // Check if passwords match
      if (password == confirmPassword) {
        // Passwords match, proceed with sign-up
        print('Email: $email');
        print('Password: $password');

        
        // Show success message or navigate to the next screen
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(content: Text('Sign-up successful!')),
        // );

        // Example: Navigate to the home screen after successful sign-up
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => HomeScreen()),
        // );
      } else {
        // Passwords do not match
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(content: Text('Passwords do not match!')),
        // );
      }
    } else {
      // Form is invalid
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Please fix the errors in the form.')),
      // );
    }
  }
}

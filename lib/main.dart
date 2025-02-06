import 'package:ecommerce_app/Features/Authenticate/presentation/views/login_view.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/signup_view.dart';
import 'package:ecommerce_app/Features/splash/presentation/views/splash_view.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      home: const SignupView(),
    );
  }
}

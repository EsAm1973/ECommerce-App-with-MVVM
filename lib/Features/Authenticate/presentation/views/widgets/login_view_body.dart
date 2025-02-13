import 'package:ecommerce_app/Core/data/UserCubit/user_cubit.dart';
import 'package:ecommerce_app/Core/utils/app_router.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/manager/LoginAuthCubit/login_auth_cubit.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/login_button.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/login_email_textfeild.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/login_password_textfeild.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/login_signp&forgetpassword.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/login_socialmedia_row.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/login_start_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginAuthCubit, LoginAuthState>(
      listener: (context, state) {
        if (state is LoginAuthSuccess) {
          context.read<UserCubit>().saveUser(state.user);
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        } else if (state is LoginAuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Center(
                    child: LoginScreenStartWidget(
                  title: 'Let\'s Sign In',
                  subtitle: 'Find All Products You Need Here',
                )),
                const SizedBox(
                  height: 40,
                ),
                EmailAddressTextFeild(
                  emailController: emailController,
                ),
                const SizedBox(
                  height: 25,
                ),
                PasswordTextFeild(
                  passwordController: passwordController,
                ),
                const SizedBox(
                  height: 25,
                ),
                BlocBuilder<LoginAuthCubit, LoginAuthState>(
                  builder: (context, state) {
                    if (state is LoginAuthLoading) {
                      return const CircularProgressIndicator();
                    }
                    return LoginButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<LoginAuthCubit>().login(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                        }
                      },
                    );
                  },
                ),
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
        ),
      ),
    );
  }
}

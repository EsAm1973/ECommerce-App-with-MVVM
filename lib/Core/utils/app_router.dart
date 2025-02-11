import 'package:ecommerce_app/Core/utils/api_service.dart';
import 'package:ecommerce_app/Features/Authenticate/data/repos/login_repo_implement.dart';
import 'package:ecommerce_app/Features/Authenticate/data/repos/register_repo_implement.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/manager/LoginAuthCubit/login_auth_cubit.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/manager/RegisterAuthCubit/register_cubit.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/login_view.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/signup_view.dart';
import 'package:ecommerce_app/Features/home/presentation/views/home_view.dart';
import 'package:ecommerce_app/Features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  //static const String kSplashView = '/';
  static const String kLoginView = '/login_view';
  static const String kSignupView = '/signup_view';
  static const String kHomeView = '/';

  static final router = GoRouter(routes: [
    // GoRoute(
    //   path: kSplashView,
    //   builder: (context, state) => const SplashView(),
    // ),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => BlocProvider(
        create: (context) => LoginAuthCubit(
            loginRepo: LoginRepoImplement(apiService: ApiService())),
        child: const LoginView(),
      ),
    ),
    GoRoute(
      path: kSignupView,
      builder: (context, state) => BlocProvider(
        create: (context) =>
            RegisterCubit(RegisterRepoImplement(apiService: ApiService())),
        child: const SignupView(),
      ),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
  ]);
}

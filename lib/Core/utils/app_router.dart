import 'package:ecommerce_app/Features/Authenticate/presentation/views/login_view.dart';
import 'package:ecommerce_app/Features/Authenticate/presentation/views/signup_view.dart';
import 'package:ecommerce_app/Features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kSplashView = '/';
  static const String kLoginView = '/login_view';
  static const String kSignupView = '/signup_view';

  static final router = GoRouter(routes: [
    GoRoute(
      path: kSplashView,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: kSignupView,
      builder: (context, state) => const SignupView(),
    ),
  ]);
}

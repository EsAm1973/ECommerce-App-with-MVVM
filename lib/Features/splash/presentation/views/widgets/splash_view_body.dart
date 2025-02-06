import 'package:ecommerce_app/Core/utils/app_router.dart';
import 'package:ecommerce_app/Core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  double _opacirty = 0.0;
  @override
  void initState() {
    super.initState();
    _animatedOpacity();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedImage(),
      ],
    );
  }

  AnimatedOpacity AnimatedImage() {
    return AnimatedOpacity(
      duration: const Duration(seconds: 1),
      opacity: _opacirty,
      curve: Curves.easeInOut,
      child: Image.asset(
        AssetsPath.logo,
        width: 200,
        height: 200,
      ),
    );
  }

  void _animatedOpacity() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _opacirty = 1.0;
      });
      Future.delayed(const Duration(seconds: 2), () {
        GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
      });
    });
  }
}

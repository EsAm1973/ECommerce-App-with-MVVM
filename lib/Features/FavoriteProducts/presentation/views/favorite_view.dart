import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Features/FavoriteProducts/presentation/views/widgets/favorite_view_body.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Favorite'),
            centerTitle: true,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            titleTextStyle: Styles.textStyle30.copyWith(letterSpacing: 1.5),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            )),
        body: const FavoriteViewBody(),
      ),
    );
  }
}

import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Features/FavoriteProducts/presentation/views/widgets/favoritelist.dart';
import 'package:ecommerce_app/Features/FavoriteProducts/presentation/views/widgets/favoritelist_item.dart';
import 'package:flutter/material.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          FavoriteList(),
        ],
      ),
    );
  }
}


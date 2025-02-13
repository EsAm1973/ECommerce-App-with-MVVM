import 'package:ecommerce_app/Features/FavoriteProducts/presentation/views/widgets/favoritelist_item.dart';
import 'package:flutter/material.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const FavoriteListItem();
        },
      ),
    );
  }
}

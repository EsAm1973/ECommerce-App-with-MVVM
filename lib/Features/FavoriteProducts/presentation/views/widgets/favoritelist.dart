import 'package:ecommerce_app/Features/FavoriteProducts/presentation/manager/FavoriteCubit/favorite_cubit.dart';
import 'package:ecommerce_app/Features/FavoriteProducts/presentation/views/widgets/favoritelist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoaded) {
          if (state.favorites.isEmpty) {
            return const Expanded(
              child: Center(
                child: Text("No Favorites added yet"),
              ),
            );
          }
          return Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.favorites.length,
              itemBuilder: (context, index) {
                return FavoriteListItem(
                  product: state.favorites[index],
                );
              },
            ),
          );
        } else if (state is FavoriteLoading) {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is FavoriteError) {
          return Expanded(
            child: Center(
              child: Text(state.message),
            ),
          );
        } else {
          return const Expanded(
            child: Center(
              child: Text("Something went wrong"),
            ),
          );
        }
      },
    );
  }
}

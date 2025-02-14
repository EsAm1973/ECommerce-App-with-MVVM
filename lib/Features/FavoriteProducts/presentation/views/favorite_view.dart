import 'package:ecommerce_app/Core/data/UserCubit/user_cubit.dart';
import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Features/FavoriteProducts/presentation/manager/FavoriteCubit/favorite_cubit.dart';
import 'package:ecommerce_app/Features/FavoriteProducts/presentation/views/widgets/favorite_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  late int userId;
  @override
  void initState() {
    super.initState();
    userId = context.read<UserCubit>().currentUser!.id;
    context.read<FavoriteCubit>().fetchFavorites(userId);
  }

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
          ),
        ),
        body: const FavoriteViewBody(),
      ),
    );
  }
}

import 'package:ecommerce_app/Core/data/UserCubit/user_cubit.dart';
import 'package:ecommerce_app/Core/data/database/favorite_database.dart';
import 'package:ecommerce_app/Core/data/database/user_database.dart';
import 'package:ecommerce_app/Core/data/repositories/user_database_rep_impl.dart';
import 'package:ecommerce_app/Core/utils/app_router.dart';
import 'package:ecommerce_app/Features/FavoriteProducts/data/repos/favorite_repo_impl.dart';
import 'package:ecommerce_app/Features/FavoriteProducts/presentation/manager/FavoriteCubit/favorite_cubit.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => FavoriteCubit(
            favoriteRepository:
                FavoriteRepositoryImpl(favoriteDatabase: FavoriteDatabase())),
      ),
      BlocProvider(
        create: (context) => UserCubit(
            userRepository: UserRepositoryImpl(userDatabase: UserDatabase())),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
      ),
    );
  }
}

import 'package:ecommerce_app/Core/data/UserCubit/user_cubit.dart';
import 'package:ecommerce_app/Core/models/productModel.dart';
import 'package:ecommerce_app/Features/FavoriteProducts/presentation/manager/FavoriteCubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopBarAndPhotos extends StatefulWidget {
  const TopBarAndPhotos({super.key, required this.product});
  final Product product;
  @override
  State<TopBarAndPhotos> createState() => _TopBarAndPhotosState();
}

class _TopBarAndPhotosState extends State<TopBarAndPhotos> {
  final PageController pageController = PageController();
  int _currentPage = 0;
  late int userId;
  @override
  void initState() {
    super.initState();
    userId = context.read<UserCubit>().currentUser!.id;
    context.read<FavoriteCubit>().fetchFavorites(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: widget.product.images
                .length, // Replace with actual number of product images
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(70),
                color: Colors.grey.shade200,
                child: Image.network(
                  widget.product.images[index],
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
        ),

        Positioned(
          top: MediaQuery.of(context).padding.top + 10,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: BlocBuilder<FavoriteCubit, FavoriteState>(
                  builder: (context, state) {
                    final cubit = context.read<FavoriteCubit>();
                    bool isFavorite = false;
                    if (state is FavoriteLoaded) {
                      isFavorite =
                          state.favorites.any((m) => m.id == widget.product.id);
                    }
                    return IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: 30,
                        color: isFavorite ? Colors.red : Colors.black,
                      ),
                      onPressed: () {
                        context
                            .read<FavoriteCubit>()
                            .toggleFavorite(widget.product, userId);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        // Dots Indicator
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.product.images.length, (index) {
              return Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? Colors.black
                      : Colors.grey.shade400,
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/Core/data/UserCubit/user_cubit.dart';
import 'package:ecommerce_app/Core/models/productModel.dart';
import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Features/FavoriteProducts/presentation/manager/FavoriteCubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteListItem extends StatelessWidget {
  const FavoriteListItem({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final userId = context.read<UserCubit>().currentUser!.id;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
              ),
              child: CachedNetworkImage(
                imageUrl: product.image,
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                ),
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        product.price.toString(),
                        style: Styles.textStyle14,
                      ),
                      IconButton(
                        onPressed: () {
                          context
                              .read<FavoriteCubit>()
                              .removeFavorite(product.id, userId);

                          context.read<FavoriteCubit>().fetchFavorites(userId);
                        },
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

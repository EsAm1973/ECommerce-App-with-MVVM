import 'package:ecommerce_app/Core/utils/app_router.dart';
import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Core/models/productModel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FlashSaleListItem extends StatelessWidget {
  const FlashSaleListItem({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kDetailsView, extra: product);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.network(
                product.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            product.name,
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Text(
                product.price.toString(),
                style: Styles.textStyle20.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                product.oldPrice.toString(),
                style: Styles.textStyle14.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

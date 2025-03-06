import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/Core/models/productModel.dart';
import 'package:ecommerce_app/Core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartItemTile extends StatelessWidget {
  final Product product;
  final int quantity;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final ValueChanged<bool> onQuantityChanged;

  const CartItemTile({
    super.key,
    required this.product,
    required this.quantity,
    required this.isChecked,
    required this.onChanged,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kDetailsView, extra: product);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.scale(
            scale: 1.3,
            child: Checkbox(
              value: isChecked,
              onChanged: onChanged,
              activeColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          //const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              width: 90,
              height: 90,
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
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${product.price}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        _buildQuantityButton(
                            Icons.remove, () => onQuantityChanged(false)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '$quantity',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        _buildQuantityButton(
                            Icons.add, () => onQuantityChanged(true)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // زر التحكم في الكمية
  Widget _buildQuantityButton(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
      ),
      child: IconButton(
        icon: Icon(icon, size: 16),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
      ),
    );
  }
}

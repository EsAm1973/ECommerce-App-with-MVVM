import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class FlashSaleListItem extends StatelessWidget {
  const FlashSaleListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
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
              child: Image.asset(
                'images/assets/producttest.png',
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
            'Apple iPhone 12 Pro Max 256GB 6 GB RAM, Pacific Blue',
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
                '\$633.00',
                style: Styles.textStyle20.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                '\$933.00',
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

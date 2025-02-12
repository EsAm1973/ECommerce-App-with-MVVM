import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            '\$399.00',
            style: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          const Text('From \$14 per month', style: Styles.textStyle14),
        ],
      ),
    );
  }
}

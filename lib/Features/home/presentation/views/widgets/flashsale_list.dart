import 'package:ecommerce_app/Features/home/presentation/views/widgets/flashslae_item.dart';
import 'package:flutter/material.dart';

class FlashSaleList extends StatelessWidget {
  const FlashSaleList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
          childAspectRatio: 0.7),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const FlashSaleListItem();
      },
    );
  }
}

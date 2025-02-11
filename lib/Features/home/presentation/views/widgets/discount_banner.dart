import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Allows image to appear outside the container
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [Colors.red.shade100, Colors.red.shade400],
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Delivery is ",
                style: Styles.textStyle16,
              ),
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "50%",
                  style: Styles.textStyle16,
                ),
              ),
              const SizedBox(width: 5),
              const Text(
                " cheaper",
                style: Styles.textStyle16,
              ),
              const Spacer(),
            ],
          ),
        ),
        Positioned(
          right: 0, // Adjust to move outside the container
          top: -23, // Move it above the container
          child: Image.asset(
            'images/assets/discount.png',
            height: 85,
            width: 85,
          ),
        ),
      ],
    );
  }
}

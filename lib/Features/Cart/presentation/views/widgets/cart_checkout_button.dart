import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key, required this.totalPrice});
  final double totalPrice;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      right: 20,
      bottom: 20,
      child: SizedBox(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Checkout",
                style: Styles.textStyle18,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "\$${totalPrice.toStringAsFixed(2)}",
                style: Styles.textStyle18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

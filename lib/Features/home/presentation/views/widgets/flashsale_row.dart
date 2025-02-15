import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class FlashSaleRow extends StatelessWidget {
  const FlashSaleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Flash Sale',
          style: Styles.textStyle30,
        ),
        const Spacer(),
        Row(
          children: [
            Text(
              'See all',
              style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey.shade200,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

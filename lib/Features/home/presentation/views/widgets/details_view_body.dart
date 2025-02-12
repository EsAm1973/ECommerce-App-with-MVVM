import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/details_imageview.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/price_container.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/rating_part.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.48,
          child: const TopBarAndPhotos(),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Apple iPhone 12 Pro Max 256GB 6 GB RAM, Pacific Blue',
                style: Styles.textStyle20.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const RatingPart(),
              const SizedBox(
                height: 10,
              ),
              const PriceContainer(),
            ],
          ),
        )
      ],
    );
  }
}


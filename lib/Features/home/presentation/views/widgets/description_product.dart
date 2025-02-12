import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DescriptionProduct extends StatelessWidget {
  const DescriptionProduct({super.key, required this.descriptionProduct});
  final String descriptionProduct;
  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      descriptionProduct, // Use cleaned text
      trimLines: 5,
      trimMode: TrimMode.Line,
      style: Styles.textStyle14
          .copyWith(height: 1.3), // Ensure line height consistency
      trimCollapsedText: " Read more",
      trimExpandedText: " Show less",
      moreStyle: Styles.textStyle16,
      lessStyle: Styles.textStyle16,
    );
  }
}

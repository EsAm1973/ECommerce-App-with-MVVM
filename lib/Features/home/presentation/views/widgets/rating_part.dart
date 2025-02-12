import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingPart extends StatelessWidget {
  const RatingPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            children: [
              Icon(Icons.star, color: Colors.red),
              SizedBox(
                width: 5,
              ),
              Text(
                '4.9',
                style: Styles.textStyle16,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '117 reviews',
                style: Styles.textStyle14,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            children: [
              Icon(FontAwesomeIcons.thumbsUp, color: Colors.red),
              SizedBox(
                width: 5,
              ),
              Text(
                'Share',
                style: Styles.textStyle16,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            children: [
              Icon(FontAwesomeIcons.comment, color: Colors.red),
              SizedBox(
                width: 5,
              ),
              Text(
                '8',
                style: Styles.textStyle16,
              ),
            ],
          ),
        )
      ],
    );
  }
}

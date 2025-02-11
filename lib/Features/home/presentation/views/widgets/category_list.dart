import 'package:ecommerce_app/Features/home/presentation/views/widgets/category_list_item.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
          child: const CategoryItem(
            title: 'Electronics',
            imagePath: 'images/assets/test.jpeg',
          ),
        ),
        InkWell(
          onTap: () {},
          child: const CategoryItem(
            title: 'Electronics',
            imagePath: 'images/assets/test.jpeg',
          ),
        ),
        InkWell(
          onTap: () {},
          child: const CategoryItem(
            title: 'Electronics',
            imagePath: 'images/assets/test.jpeg',
          ),
        ),
      ],
    );
  }
}

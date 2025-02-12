import 'package:ecommerce_app/Features/home/data/models/productModel.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/details_view_body.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DetailsViewBody(
          product: product,
        ),
      ),
    );
  }
}

import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Core/models/productModel.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/add_cart_button.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/description_product.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/details_imageview.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/price_container.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/rating_part.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.50,
            child:  TopBarAndPhotos(productImages: product.images,),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
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
                 PriceContainer(price: product.price,),
                const SizedBox(
                  height: 20,
                ),
                DescriptionProduct(
                  descriptionProduct: product.description,
                ),
                const SizedBox(
                  height: 20,
                ),
                const AddCartButton(),
                const SizedBox(height: 5,),
              ],
            ),
          )
        ],
      ),
    );
  }
}

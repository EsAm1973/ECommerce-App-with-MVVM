import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Core/widgets/custom_button.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/description_product.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/details_imageview.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/price_container.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/rating_part.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.48,
            child: const TopBarAndPhotos(),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                const SizedBox(
                  height: 20,
                ),
                DescriptionProduct(
                  descriptionProduct: description,
                ),
                const SizedBox(
                  height: 20,
                ),
                AddCartButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}


class AddCartButton extends StatelessWidget {
  const AddCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomIconTextButton(
      onPressed: () {},
      text: 'Add to Cart',
      icon: FontAwesomeIcons.cartShopping,
    );
  }
}

import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Features/home/presentation/manager/FetchCategory/category_cubit.dart';
import 'package:ecommerce_app/Features/home/presentation/manager/FetchProducts/product_cubit.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/category_list.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/discount_banner.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/flashsale_list.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/flashsale_row.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/search_textfeild.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryCubit, CategoryState>(
      listener: (context, state) {
        if (state is CategorySuccess && state.categories.isNotEmpty) {
          // Select first category by default
          final initialCategory = state.categories.first;
          context.read<ProductCubit>()
            ..selectCategory(initialCategory.id)
            ..fetchProducts(categoryId: initialCategory.id);
        }
      },
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              SizedBox(
                height: 20,
              ),
              SearchTextFeild(),
              SizedBox(
                height: 20,
              ),
              DiscountBanner(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Categories',
                style: Styles.textStyle30,
              ),
              SizedBox(
                height: 10,
              ),
              CategoriesList(),
              SizedBox(
                height: 20,
              ),
              FlashSaleRow(),
              SizedBox(
                height: 20,
              ),
              FlashSaleList(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:ecommerce_app/Features/home/presentation/manager/FetchCategory/category_cubit.dart';
import 'package:ecommerce_app/Features/home/presentation/manager/FetchProducts/product_cubit.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/category_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategorySuccess) {
          return SizedBox(
            height: 120,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                final category = state.categories[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CategoryItem(
                    category: category,
                    isSelected:
                        context.watch<ProductCubit>().selectedCategoryId ==
                            category.id,
                    onTap: () {
                      context.read<ProductCubit>()
                        ..selectCategory(category.id)
                        ..fetchProducts(categoryId: category.id);
                    },
                  ),
                );
              },
            ),
          );
        } else if (state is CategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CategoryFailure) {
          return Center(child: Text(state.errorMessage));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

import 'package:ecommerce_app/Features/home/presentation/manager/FetchProducts/product_cubit.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/flashslae_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlashSaleList extends StatelessWidget {
  const FlashSaleList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const SizedBox(
            height: 300,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is ProductSuccess) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return FlashSaleListItem(
                product: state.products[index],
              );
            },
          );
        } else if (state is ProductFailure) {
          return SizedBox(
            height: 100,
            child: Center(
              child: Text(state.errorMessage),
            ),
          );
        } else {
          return const SizedBox(
            height: 300,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

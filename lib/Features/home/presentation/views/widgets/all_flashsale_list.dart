import 'package:ecommerce_app/Features/home/presentation/manager/FetchProducts/product_cubit.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/flashslae_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllFlashSaleList extends StatelessWidget {
  const AllFlashSaleList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductSuccess) {
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
              childAspectRatio: 0.65,
            ),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return FlashSaleListItem(
                product: state.products[index],
              );
            },
          );
        } else if (state is ProductFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: Text("Something went wrong"));
        }
      },
    );
  }
}

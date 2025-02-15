import 'package:ecommerce_app/Features/home/presentation/views/widgets/all_flashsale_list.dart';
import 'package:flutter/material.dart';

class AllFlashsaleViewBody extends StatelessWidget {
  const AllFlashsaleViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: AllFlashSaleList(),
    );
  }
}


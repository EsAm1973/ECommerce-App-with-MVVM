import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/all_flashsale_view_body.dart';
import 'package:flutter/material.dart';

class AllFlashsaleView extends StatelessWidget {
  const AllFlashsaleView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Flashsale Products'),
        centerTitle: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        titleTextStyle: Styles.textStyle20
            .copyWith(fontWeight: FontWeight.bold, letterSpacing: 1.5),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
      body: const AllFlashsaleViewBody(),
    ));
  }
}

import 'package:ecommerce_app/Features/home/presentation/views/widgets/details_imageview.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.55,
          child: const TopBarAndPhotos(),
        ),
      ],
    );
  }
}

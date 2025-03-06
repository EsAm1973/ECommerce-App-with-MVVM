import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class CartSelectAll extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  const CartSelectAll(
      {super.key, required this.isChecked, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      leading: Transform.scale(
        scale: 1.3,
        child: Checkbox(
          value: isChecked,
          onChanged: onChanged,
          activeColor: Colors.red,
          checkColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      title: Text(
        'Select All',
        style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w400),
      ),
      minLeadingWidth: 0,
    );
  }
}

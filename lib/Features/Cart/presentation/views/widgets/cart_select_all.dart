import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartSelectAll extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final VoidCallback? onRemove; // زر الحذف

  const CartSelectAll({
    super.key,
    required this.isChecked,
    required this.onChanged,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
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
      trailing: IconButton(
        icon: const Icon(FontAwesomeIcons.solidTrashCan, color: Colors.red),
        onPressed: onRemove,
      ),
      minLeadingWidth: 0,
    );
  }
}

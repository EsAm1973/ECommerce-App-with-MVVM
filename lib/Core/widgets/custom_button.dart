import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomIconTextButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const CustomIconTextButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = Colors.red,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: Styles.textStyle16.copyWith(color: Colors.white)),
          const SizedBox(width: 8),
          Icon(icon, color: iconColor,size: 20,),
        ],
      ),
    );
  }
}

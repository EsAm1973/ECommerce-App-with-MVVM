import 'package:flutter/material.dart';

class BuildSocialIcon extends StatelessWidget {
  const BuildSocialIcon({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        icon: Icon(icon),
        iconSize: 30,
        onPressed: () {},
      ),
    );
  }
}

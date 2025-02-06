import 'package:ecommerce_app/Features/Authenticate/presentation/views/widgets/login_build_socialicon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaIconsRow extends StatelessWidget {
  const SocialMediaIconsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: BuildSocialIcon(icon: FontAwesomeIcons.google),
        ),
        SizedBox(width: 10),
        Expanded(
          child: BuildSocialIcon(icon: FontAwesomeIcons.facebookF),
        ),
        SizedBox(width: 10),
        Expanded(
          child: BuildSocialIcon(icon: FontAwesomeIcons.instagram),
        ),
      ],
    );
  }
}

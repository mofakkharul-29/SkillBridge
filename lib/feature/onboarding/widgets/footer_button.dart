import 'package:flutter/material.dart';
import 'package:skill_bridge/core/utils/app_scale.dart';
import 'package:skill_bridge/core/utils/primary_button.dart';

class FooterButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final IconData? icon;
  const FooterButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: AppScale.dp(30),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppScale.dp(20.5)),
        child: PrimaryButton(text: text, onPressed: onPressed, icon: icon),
      ),
    );
  }
}

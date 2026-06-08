import 'package:flutter/material.dart';
import 'package:skill_bridge/core/theme/app_colors.dart';
import 'package:skill_bridge/core/utils/app_scale.dart';
import 'package:skill_bridge/core/utils/global_text.dart';

class PrimaryTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const PrimaryTextButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 10),
      child: InkWell(
        onTap: onPressed,
        splashColor: Colors.transparent,
        child: GlobalText(
          text: text,
          fontSize: AppScale.sp(15),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          color: AppColors.kPrimary,
        ),
      ),
    );
  }
}

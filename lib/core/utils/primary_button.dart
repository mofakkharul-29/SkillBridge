import 'package:flutter/material.dart';
import 'package:skill_bridge/core/theme/app_colors.dart';
import 'package:skill_bridge/core/utils/app_scale.dart';
import 'package:skill_bridge/core/utils/global_text.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.kPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(AppScale.dp(15)),
        ),
        padding: EdgeInsets.symmetric(vertical: AppScale.dp(12.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GlobalText(text: text, fontSize: AppScale.sp(16), height: 1.2),
          SizedBox(width: AppScale.dp(10)),
          Icon(icon, size: AppScale.sp(28)),
        ],
      ),
    );
  }
}

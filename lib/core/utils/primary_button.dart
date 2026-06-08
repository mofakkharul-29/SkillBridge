import 'package:flutter/material.dart';
import 'package:skill_bridge/core/theme/app_colors.dart';
import 'package:skill_bridge/core/utils/app_scale.dart';
import 'package:skill_bridge/core/utils/global_text.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onPressed;
  final double iconSize;
  final double vtPadding;
  final double textFont;
  final bool isNeed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool isPrefixNeed;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.iconSize = 28,
    this.vtPadding = 13.5,
    this.textFont = 16,
    this.isNeed = true,
    this.backgroundColor = AppColors.kPrimary,
    this.foregroundColor = Colors.white,
    this.isPrefixNeed = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(AppScale.dp(15)),
        ),
        padding: EdgeInsets.symmetric(vertical: AppScale.dp(vtPadding)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isPrefixNeed
              ? Image.asset(
                  'assets/images/google.png',
                  fit: BoxFit.contain,
                  height: AppScale.dp(22),
                  width: AppScale.dp(22),
                )
              : const SizedBox.shrink(),

          isPrefixNeed ? SizedBox(width: AppScale.dp(15)) : SizedBox.shrink(),

          GlobalText(
            text: text,
            fontSize: AppScale.sp(textFont),
            height: 1.2,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
          SizedBox(width: AppScale.dp(10)),
          isNeed
              ? Icon(icon, size: AppScale.sp(iconSize))
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

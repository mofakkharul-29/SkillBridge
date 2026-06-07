import 'package:flutter/material.dart';
import 'package:skill_bridge/core/theme/app_colors.dart';
import 'package:skill_bridge/core/utils/app_scale.dart';
import 'package:skill_bridge/core/utils/global_card.dart';
import 'package:skill_bridge/core/utils/global_text.dart';

class HeaderSection extends StatelessWidget {
  final double height;
  final double width;
  final double iconSize;
  final double fontSize;

  const HeaderSection({
    super.key,
    this.height = 60,
    this.width = 60,
    this.iconSize = 35,
    this.fontSize = 34,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GlobalCard(
          alignment: Alignment.center,
          height: AppScale.dp(height),
          width: AppScale.dp(width),
          color: AppColors.kPrimary,
          borderRadius: BorderRadius.circular(AppScale.dp(15)),
          padding: EdgeInsets.all(AppScale.dp(5.5)),
          child: Icon(
            Icons.school_outlined,
            color: AppColors.scaffoldBgColor,
            size: AppScale.dp(iconSize),
          ),
        ),

        SizedBox(width: AppScale.dp(12)),

        GlobalText(
          text: 'SkillBridge',
          color: AppColors.kPrimary,
          fontSize: AppScale.sp(fontSize),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          height: 1.5,
        ),
      ],
    );
  }
}

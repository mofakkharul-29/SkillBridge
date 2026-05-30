import 'package:flutter/material.dart';
import 'package:skill_bridge/core/theme/app_colors.dart';
import 'package:skill_bridge/core/utils/app_scale.dart';
import 'package:skill_bridge/core/utils/global_card.dart';
import 'package:skill_bridge/core/utils/global_text.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GlobalCard(
          alignment: Alignment.center,
          height: AppScale.dp(60),
          width: AppScale.dp(60),
          color: AppColors.kPrimary,
          borderRadius: BorderRadius.circular(AppScale.dp(15)),
          padding: EdgeInsets.all(AppScale.dp(5.5)),
          child: Icon(
            Icons.school_outlined,
            color: AppColors.scaffoldBgColor,
            size: AppScale.dp(35),
          ),
        ),

        SizedBox(width: AppScale.dp(12)),

        GlobalText(
          text: 'SkillBridge',
          color: AppColors.kPrimary,
          fontSize: AppScale.sp(34),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          height: 1.5,
        ),
      ],
    );
  }
}

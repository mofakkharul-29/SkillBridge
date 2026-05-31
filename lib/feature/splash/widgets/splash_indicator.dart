import 'package:flutter/material.dart';
import 'package:skill_bridge/core/theme/app_colors.dart';
import 'package:skill_bridge/core/utils/app_scale.dart';

class SplashIndicator extends StatelessWidget {
  final int activeDotIndex;
  final double activeWidth;
  final double activeHeight;
  final int millisecond;

  const SplashIndicator({
    super.key,
    required this.activeDotIndex,
    required this.activeWidth,
    required this.activeHeight,
    required this.millisecond,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        final bool isActive = index == activeDotIndex;

        return AnimatedContainer(
          duration: Duration(milliseconds: millisecond),
          margin: EdgeInsets.all(5),
          height: AppScale.dp(isActive ? activeHeight : 8),
          width: AppScale.dp(isActive ? activeWidth : 8),
          decoration: BoxDecoration(
            color: isActive ? AppColors.kPrimary : AppColors.kSecondary,
            borderRadius: BorderRadius.circular(50),
          ),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:skill_bridge/core/theme/app_colors.dart';
import 'package:skill_bridge/core/utils/app_scale.dart';

class SplashIndicator extends StatelessWidget {
  final int activeDotIndex;

  const SplashIndicator({super.key, required this.activeDotIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        final bool isActive = index == activeDotIndex;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          margin: EdgeInsets.all(5),
          height: AppScale.dp(isActive ? 10 : 8),
          width: AppScale.dp(isActive ? 10 : 8),
          decoration: BoxDecoration(
            color: isActive ? AppColors.kPrimary : AppColors.kSecondary,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}

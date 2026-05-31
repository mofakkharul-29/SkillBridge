import 'package:flutter/material.dart';
import 'package:skill_bridge/core/utils/app_scale.dart';
import 'package:skill_bridge/feature/splash/widgets/splash_indicator.dart';

class Indicator extends StatelessWidget {
  final int currentIndex;

  const Indicator({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: AppScale.dp(110),
      child: SplashIndicator(
        activeDotIndex: currentIndex,
        activeWidth: AppScale.dp(30),
        activeHeight: AppScale.dp(8),
        millisecond: 600,
      ),
    );
  }
}

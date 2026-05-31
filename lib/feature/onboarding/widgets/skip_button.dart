import 'package:flutter/material.dart';
import 'package:skill_bridge/core/utils/app_scale.dart';
import 'package:skill_bridge/core/utils/global_text.dart';

class SkipButton extends StatelessWidget {
  final void Function()? onPressed;
  const SkipButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: AppScale.dp(10),
      top: AppScale.dp(15),
      child: TextButton(
        onPressed: onPressed,
        child: GlobalText(
          text: 'Skip',
          color: const Color.fromARGB(255, 107, 103, 103),
          fontSize: AppScale.sp(16),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

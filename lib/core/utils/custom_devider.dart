import 'package:flutter/material.dart';
import 'package:skill_bridge/core/utils/app_scale.dart';
import 'package:skill_bridge/core/utils/global_text.dart';

class CustomDevider extends StatelessWidget {
  const CustomDevider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: getDevider(endIndent: 10.0, indent: 10.0)),

        GlobalText(
          text: 'or continue with',
          fontSize: AppScale.sp(16),
          fontFamily: 'Inter',
          color: const Color(0xFF616161),
          height: AppScale.dp(1.2),
        ),

        Expanded(child: getDevider(endIndent: 10.0, indent: 10.0)),
      ],
    );
  }

  Widget getDevider({required double endIndent, required double indent}) {
    return Divider(
      endIndent: endIndent,
      indent: indent,
      color: const Color(0xFFC7C6C6),
      thickness: 1.5,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:skill_bridge/core/utils/global_text.dart';

class FeedbackHandler {
  static void showFeedback({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: GlobalText(text: message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

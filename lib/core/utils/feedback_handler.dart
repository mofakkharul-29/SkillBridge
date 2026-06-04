import 'package:flutter/material.dart';
import 'package:skill_bridge/core/routes/router_configuration.dart';
import 'package:skill_bridge/core/utils/global_text.dart';

class FeedbackHandler {
  static void show({required String message}) {
    final context = rootNavigatorKey.currentContext;
    if (context == null) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: GlobalText(text: message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xFF69F0AE),
      ),
    );
  }
}

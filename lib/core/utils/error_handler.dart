import 'package:flutter/material.dart';
import 'package:skill_bridge/core/exceptions/app_exceptions.dart';
import 'package:skill_bridge/core/routes/router_configuration.dart';
import 'package:skill_bridge/core/utils/global_text.dart';

class ErrorHandler {
  static void show(AppExceptions exception) {
    final context = rootNavigatorKey.currentContext;

    if (context == null) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: GlobalText(text: exception.userMessage),
        backgroundColor: const Color(0xFFF44336),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

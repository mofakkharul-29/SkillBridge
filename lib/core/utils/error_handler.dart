import 'package:flutter/material.dart';
import 'package:skill_bridge/core/exceptions/app_exceptions.dart';
import 'package:skill_bridge/core/utils/global_text.dart';

class ErrorHandler {
  static void show(BuildContext context, AppExceptions exception) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: GlobalText(text: exception.userMessage),
        backgroundColor: const Color(0xFFF44336),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

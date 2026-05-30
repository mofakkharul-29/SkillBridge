import 'package:flutter/material.dart';

class AppScale {
  AppScale._();

  static double _scaleFactor = 1.0;

  static void init(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    _scaleFactor = (width / 360).clamp(0.9, 1.2);
  }

  static double sp(double size) => size * _scaleFactor;

  static double dp(double size) => size * _scaleFactor;
}

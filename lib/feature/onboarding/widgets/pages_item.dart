import 'package:flutter/material.dart';

class PagesItem {
  final IconData icon;
  final String title;
  final String subTitle;
  final Color color;
  final Color secondaryColor;
  final int index;

  const PagesItem({
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.color,
    required this.secondaryColor,
    required this.index,
  });
}

import 'package:flutter/material.dart';
import 'package:skill_bridge/core/theme/app_colors.dart';
import 'package:skill_bridge/core/utils/app_scale.dart';
import 'package:skill_bridge/feature/onboarding/widgets/pages_item.dart';

class PageBuilderHelper {
  static const List<PagesItem> pages = [
    PagesItem(
      icon: Icons.search_outlined,
      title: 'Find Your Perfect Tutor',
      subTitle:
          'Browse hundreds of verified teachers by subject, price and rating',
      color: AppColors.kPrimary,
      secondaryColor: Color(0x191565C0),
      index: 0,
    ),

    PagesItem(
      icon: Icons.people_alt_outlined,
      title: 'Teach & Earn',
      subTitle:
          'Create your profile, set your rate and start accepting bookings',
      color: Color(0xFF22C55E),
      secondaryColor: Color(0xFFE3F8EB),
      index: 1,
    ),

    PagesItem(
      icon: Icons.chat_bubble_outline_outlined,
      title: 'Book, Chat & Learn',
      subTitle: 'Schedule sessions, chat in real-time and track your progress',
      color: Color(0xFFF59E0B),
      secondaryColor: Color(0xFFFEF3E0),
      index: 2,
    ),
  ];

  static Widget getIcon({
    required IconData icon,
    required double size,
    Color? color,
  }) {
    return Icon(icon, color: color, size: AppScale.dp(size));
  }
}

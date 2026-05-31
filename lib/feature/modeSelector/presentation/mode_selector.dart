import 'package:flutter/material.dart';
import 'package:skill_bridge/core/theme/app_colors.dart';
import 'package:skill_bridge/core/utils/app_scale.dart';
import 'package:skill_bridge/core/utils/global_card.dart';
import 'package:skill_bridge/core/utils/global_text.dart';
import 'package:skill_bridge/core/utils/primary_button.dart';
import 'package:skill_bridge/feature/modeSelector/widget/user_role.dart';

class ModeSelector extends StatefulWidget {
  const ModeSelector({super.key});

  @override
  State<ModeSelector> createState() => _ModeSelectorState();
}

class _ModeSelectorState extends State<ModeSelector> {
  late UserRole activeRole;

  @override
  void initState() {
    activeRole = UserRole.unselected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlobalText(
                text: 'I am a...',
                fontSize: AppScale.sp(35),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                height: 1.2,
                color: const Color(0xDD000000),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: AppScale.dp(50)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        activeRole = UserRole.student;
                      });
                    },
                    child: getCard(
                      title: 'Student',
                      subTitle: 'Find & book tutors',
                      icon: Icons.menu_book_rounded,
                      isSelected: activeRole == UserRole.student,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        activeRole = UserRole.teacher;
                      });
                    },
                    child: getCard(
                      title: 'Teacher',
                      subTitle: 'Offer your skills',
                      icon: Icons.school_rounded,
                      isSelected: activeRole == UserRole.teacher,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppScale.dp(50)),

              PrimaryButton(
                text: 'Continue',
                icon: null,
                onPressed:
                    (activeRole == UserRole.student ||
                        activeRole == UserRole.teacher)
                    ? () {}
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCard({
    required String title,
    required String subTitle,
    required IconData icon,
    required bool isSelected,
  }) {
    return GlobalCard(
      padding: EdgeInsets.symmetric(
        horizontal: AppScale.dp(15),
        vertical: AppScale.dp(8.0),
      ),
      alignment: Alignment.center,
      height: AppScale.dp(300),
      width: AppScale.dp(160),
      color: isSelected ? const Color(0xFFE5F3FA) : Colors.white,
      border: Border.all(
        color: isSelected ? AppColors.kPrimary : const Color(0x1F000000),
        width: AppScale.dp(1.2),
      ),
      borderRadius: BorderRadius.circular(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: isSelected
                ? AppColors.kPrimary
                : const Color(0x1E9E9E9E),
            radius: AppScale.dp(50),
            child: Icon(
              icon,
              color: isSelected ? Colors.white : const Color(0xFF9E9E9E),
              size: AppScale.dp(60),
            ),
          ),

          SizedBox(height: AppScale.dp(20)),

          GlobalText(
            textAlign: TextAlign.center,
            text: title,
            fontFamily: 'Poppins',
            fontSize: AppScale.sp(20),
            fontWeight: FontWeight.w600,
            color: const Color(0xDD000000),
            height: 1.5,
          ),

          SizedBox(height: AppScale.dp(20)),

          GlobalText(
            text: subTitle,
            fontFamily: 'Inter',
            fontSize: AppScale.sp(18),
            fontWeight: FontWeight.w600,
            color: const Color(0xDD585858),
            height: 1.5,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

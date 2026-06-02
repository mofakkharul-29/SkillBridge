import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_bridge/core/theme/app_colors.dart';
import 'package:skill_bridge/core/utils/app_scale.dart';
import 'package:skill_bridge/core/utils/global_card.dart';
import 'package:skill_bridge/core/utils/global_text.dart';
import 'package:skill_bridge/core/utils/system_ui_helper.dart';
import 'package:skill_bridge/feature/onboarding/provider/onboarding_status_provider.dart';
import 'package:skill_bridge/feature/onboarding/widgets/footer_button.dart';
import 'package:skill_bridge/feature/onboarding/widgets/indicator.dart';
import 'package:skill_bridge/feature/onboarding/widgets/pages_builder_helper.dart';
import 'package:skill_bridge/feature/onboarding/widgets/pages_item.dart';
import 'package:skill_bridge/feature/onboarding/widgets/skip_button.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _controller = PageController();
  final List<PagesItem> pages = PageBuilderHelper.pages;
  int _currentIndex = 0;

  @override
  void initState() {
    SystemUiHelper.hideStatusbar();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemUiHelper.showStatusBar();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onboardingState = ref.watch(onboardingStatusProvider);
    final isLoading = onboardingState.isLoading;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: AppScale.dp(10.5),
              right: AppScale.dp(10.5),
              top: AppScale.dp(90),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GlobalCard(
                  height: AppScale.dp(280),
                  width: AppScale.dp(280),
                  color: pages[_currentIndex].secondaryColor,
                  shape: BoxShape.circle,
                  alignment: Alignment.center,
                  child: PageView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    controller: _controller,
                    itemCount: pages.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                      debugPrint('current index: $_currentIndex');
                    },
                    itemBuilder: (context, index) {
                      final currentPage = pages[index];
                      return PageBuilderHelper.getIcon(
                        icon: currentPage.icon,
                        size: 140,
                        color: currentPage.color,
                      );
                    },
                  ),
                ),

                SizedBox(height: AppScale.dp(45)),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppScale.dp(12.0)),
                  child: getText(
                    text: pages[_currentIndex].title,
                    fontSize: AppScale.sp(32),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    color: const Color(0xDD000000),
                  ),
                ),

                SizedBox(height: AppScale.dp(20)),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppScale.dp(7.0)),
                  child: getText(
                    text: pages[_currentIndex].subTitle,
                    fontSize: AppScale.sp(16),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),

          Indicator(currentIndex: _currentIndex),

          FooterButton(
            text: _currentIndex < pages.length - 1
                ? 'Next'
                : isLoading
                ? 'Loading...'
                : 'Get Started',
            icon: Icons.arrow_right_alt,
            onPressed: isLoading
                ? null
                : _currentIndex < pages.length - 1
                ? () {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                : () async {
                    await ref
                        .read(onboardingStatusProvider.notifier)
                        .completeOnboarding();
                  },
          ),

          _currentIndex < pages.length - 1
              ? SkipButton(
                  onPressed: () {
                    _controller.animateToPage(
                      pages.length - 1,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                    );
                  },
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget getText({
    required String text,
    textAlign = TextAlign.center,
    required fontSize,
    fontWeight = FontWeight.w600,
    color = const Color(0xFF7A7979),
    fontFamily = 'Intern',
    height = 1.2,
  }) {
    return GlobalText(
      text: text,
      textAlign: textAlign,
      fontSize: fontSize,
      height: height,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
    );
  }
}

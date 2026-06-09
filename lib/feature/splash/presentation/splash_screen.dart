import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_bridge/core/theme/app_colors.dart';
import 'package:skill_bridge/core/utils/app_scale.dart';
import 'package:skill_bridge/core/utils/global_text.dart';
import 'package:skill_bridge/core/utils/pre_cache_manager.dart';
import 'package:skill_bridge/core/utils/system_ui_helper.dart';
import 'package:skill_bridge/feature/splash/provider/splash_update_status.dart';
import 'package:skill_bridge/feature/splash/widgets/header_section.dart';
import 'package:skill_bridge/feature/splash/widgets/splash_indicator.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  int _activeDotIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(milliseconds: 900), (_) {
      setState(() {
        _activeDotIndex = (_activeDotIndex + 1) % 3;
      });
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      ref.read(splashUpdateStatus.notifier).state = true;
    });
    SystemUiHelper.hideStatusbar();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    PreCacheManager.preloadImages(context);
  }

  @override
  void dispose() {
    _timer.cancel();
    SystemUiHelper.showStatusBar();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const HeaderSection(),
                  GlobalText(
                    text: 'Learn from the best',
                    height: 1.5,
                    fontSize: AppScale.sp(16),
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 122, 121, 121),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: AppScale.dp(0),
            right: AppScale.dp(0),
            bottom: AppScale.dp(80),
            child: SplashIndicator(
              activeDotIndex: _activeDotIndex,
              activeWidth: 10,
              activeHeight: 10,
              millisecond: 800,
            ),
          ),
        ],
      ),
    );
  }
}

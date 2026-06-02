import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_bridge/feature/onboarding/repository/onboarding_status.dart';

final onboardingStatusProvider =
    AsyncNotifierProvider<OnboardingStatusNotifier, bool>(
      OnboardingStatusNotifier.new,
    );

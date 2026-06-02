import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_bridge/feature/auth/provider/dummy_auth_state.dart';
import 'package:skill_bridge/feature/modeSelector/provider/role_notifier_provider.dart';
import 'package:skill_bridge/feature/onboarding/provider/onboarding_status_provider.dart';
import 'package:skill_bridge/feature/splash/provider/splash_update_status.dart';

class RouterListenable extends ChangeNotifier {
  final Ref _ref;

  RouterListenable(this._ref) {
    _ref.listen(splashUpdateStatus, (_, _) => notifyListeners());
    _ref.listen(onboardingStatusProvider, (_, _) => notifyListeners());
    _ref.listen(roleNotifierProvider, (_, _) => notifyListeners());
    _ref.listen(splashUpdateStatus, (_, _) => notifyListeners());
    _ref.listen(authStateProvider, (_, _) => notifyListeners());
  }
}


import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingStatusNotifier extends AsyncNotifier<bool> {
  late SharedPreferences _pref;

  @override
  Future<bool> build() async {
    _pref = await SharedPreferences.getInstance();
    return _pref.getBool('isFirstLaunched') ?? true;
  }

  Future<void> completeOnboarding() async {
    state = const AsyncLoading();

    try {
      await _pref.setBool('isFirstLaunched', false);
      state = AsyncData(false);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  bool get isFirstLauncheSafe => state.value ?? true;
}

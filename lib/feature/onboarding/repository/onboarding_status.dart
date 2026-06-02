import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingStatusNotifier extends AsyncNotifier<bool> {
  late SharedPreferences _pref;

  @override
  Future<bool> build() async {
    _pref = await SharedPreferences.getInstance();
    return _pref.getBool('isFirstLaunched') ?? false;
  }

  Future<void> completeOnboarding() async {
    state = const AsyncLoading();

    try {
      await _pref.setBool('isFirstLaunched', true);
      state = AsyncData(true);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

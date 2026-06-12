import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_bridge/feature/auth/data/repository/user_repository.dart';
import 'package:skill_bridge/feature/auth/model/app_user.dart';
import 'package:skill_bridge/feature/auth/provider/user_repo_provider.dart';

class UserNotifier extends AsyncNotifier<AppUser?> {
  late UserRepository _userRepository;

  @override
  Future<AppUser?> build() async {
    _userRepository = ref.watch(userRepoProvider);

    return null;
  }

  Future<void> writeUser(AppUser user) async {
    state = const AsyncLoading();
    try {
      await _userRepository.writeUser(user: user);
      state = AsyncData(user);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> readUser(String uid) async {
    state = const AsyncLoading();
    try {
      final AppUser user = await _userRepository.readUser(uid: uid);
      state = AsyncData(user);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}

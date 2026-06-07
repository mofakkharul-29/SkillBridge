import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_bridge/core/enums/user_role.dart';
import 'package:skill_bridge/core/utils/error_handler.dart';
import 'package:skill_bridge/core/utils/feedback_handler.dart';
import 'package:skill_bridge/feature/auth/data/repository/auth_repository/auth_repo.dart';
import 'package:skill_bridge/feature/auth/exceptions/auth_repo_exception.dart';
import 'package:skill_bridge/feature/auth/model/app_user.dart';
import 'package:skill_bridge/feature/auth/provider/auth_repo_provider.dart';
import 'package:skill_bridge/feature/auth/provider/repo_notifier_provider.dart';

class AuthRepoNotifier extends AsyncNotifier<AppUser?> {
  late AuthRepo _repo;

  @override
  Future<AppUser?> build() async {
    _repo = ref.watch(authRepoProvider);
    return null;
  }

  Future<void> registerWithEmailPassword({
    required String email,
    required String password,
    required String fullName,
    required UserRole role,
    required String phoneNumber,
  }) async {
    state = const AsyncLoading();
    try {
      final AppUser user = await _repo.registerWithEmailPassword(
        email: email,
        password: password,
        fullName: fullName,
        role: role,
        phoneNumber: phoneNumber,
      );
      await ref.read(userRepoNitifierProvider.notifier).createUserData(user);
      state = AsyncData(user);
      FeedbackHandler.show(message: 'Account created successfully');
    } on AuthRepoException catch (e) {
      state = AsyncError(e, StackTrace.current);
      ErrorHandler.show(e);
    }
  }
}

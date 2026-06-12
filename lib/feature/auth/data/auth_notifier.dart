import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_bridge/core/enums/user_role.dart';
import 'package:skill_bridge/feature/auth/data/repository/auth_repository.dart';
import 'package:skill_bridge/feature/auth/data/repository/user_repository.dart';
import 'package:skill_bridge/feature/auth/model/app_user.dart';
import 'package:skill_bridge/feature/auth/provider/auth_repo_provider.dart';
import 'package:skill_bridge/feature/auth/provider/user_repo_provider.dart';

class AuthNotifier extends AsyncNotifier<AppUser?> {
  late AuthRepository _authRepository;
  late UserRepository _repository;

  @override
  Future<AppUser?> build() async {
    _authRepository = ref.watch(authRepoProvider);
    _repository = ref.watch(userRepoProvider);

    return null;
  }

  Future<void> registerWithEmailPassword({
    required String email,
    required String password,
    required UserRole role,
    required String fullName,
    required String phoneNumber,
  }) async {
    state = const AsyncLoading();
    try {
      final AppUser user = await _authRepository.registerWithEmailPassword(
        email: email,
        password: password,
        role: role,
        fullName: fullName,
        phoneNumber: phoneNumber,
      );
      await _repository.writeUser(user: user);
      state = AsyncData(user);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    try {
      final String uid = await _authRepository.loginWithEmailPassword(
        email: email,
        password: password,
      );
      final AppUser user = await _repository.readUser(uid: uid);
      state = AsyncData(user);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}

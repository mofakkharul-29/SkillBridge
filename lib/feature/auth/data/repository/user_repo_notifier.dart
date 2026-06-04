import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_bridge/core/utils/error_handler.dart';
import 'package:skill_bridge/core/utils/feedback_handler.dart';
import 'package:skill_bridge/feature/auth/data/repository/user_repository/user_repo.dart';
import 'package:skill_bridge/feature/auth/exceptions/user_repo_exception.dart';
import 'package:skill_bridge/feature/auth/model/app_user.dart';
import 'package:skill_bridge/feature/auth/provider/user_repo_provider.dart';

class UserRepoNotifier extends AsyncNotifier<AppUser?> {
  late UserRepo _repo;
  StreamSubscription<AppUser>? _userSubscription;

  @override
  Future<AppUser?> build() async {
    _repo = ref.watch(userRepoProvider);

    ref.onDispose(() {
      _userSubscription?.cancel();
    });

    return null;
  }

  Future<void> createUserData(AppUser user) async {
    state = const AsyncLoading();
    try {
      await _repo.createUser(user);
      state = AsyncData(user);
      FeedbackHandler.show(message: 'data store created');
    } on UserRepoException catch (e) {
      state = AsyncError(e, StackTrace.current);
      ErrorHandler.show(e);
    }
  }

  //for getting one time user info
  Future<void> getUserData(String uid) async {
    state = const AsyncLoading();
    try {
      final AppUser user = await _repo.fetchUser(uid);
      state = AsyncData(user);
    } on UserRepoException catch (e) {
      state = AsyncError(e, StackTrace.current);
      ErrorHandler.show(e);
    }
  }

  Future<void> updateUserData(AppUser user) async {
    state = const AsyncLoading();
    try {
      await _repo.updateUser(user);
      state = AsyncData(user);
      FeedbackHandler.show(message: 'Profile updated');
    } on UserRepoException catch (e) {
      state = AsyncError(e, StackTrace.current);
      ErrorHandler.show(e);
    }
  }

  Future<void> deleteUserData(String uid) async {
    state = const AsyncLoading();
    try {
      await _repo.deleteUser(uid);
      state = AsyncData(null);
      FeedbackHandler.show(message: 'data store deleted successfully');
    } on UserRepoException catch (e) {
      state = AsyncError(e, StackTrace.current);
      ErrorHandler.show(e);
    }
  }

  // always show user with updated info
  void watchUser(String uid) {
    _userSubscription?.cancel();
    state = const AsyncLoading();
    _userSubscription = _repo
        .watchUser(uid)
        .listen(
          (user) {
            state = AsyncData(user);
          },
          onError: (e, st) {
            state = AsyncError(e, st);
            if (e is UserRepoException) ErrorHandler.show(e);
          },
        );
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_bridge/feature/auth/data/repository/user_repo_notifier.dart';
import 'package:skill_bridge/feature/auth/model/app_user.dart';

final userRepoNitifierProvider =
    AsyncNotifierProvider<UserRepoNotifier, AppUser?>(UserRepoNotifier.new);

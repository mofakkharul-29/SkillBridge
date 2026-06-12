import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_bridge/feature/auth/data/user_notifier.dart';
import 'package:skill_bridge/feature/auth/model/app_user.dart';

final userNotifierProvider = AsyncNotifierProvider<UserNotifier, AppUser?>(
  UserNotifier.new,
);

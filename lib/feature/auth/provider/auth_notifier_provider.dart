import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_bridge/feature/auth/data/auth_notifier.dart';
import 'package:skill_bridge/feature/auth/model/app_user.dart';

final authNotifierProvider = AsyncNotifierProvider<AuthNotifier, AppUser?>(
  AuthNotifier.new,
);

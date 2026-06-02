import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_bridge/feature/modeSelector/repository/role_notifier.dart';
import 'package:skill_bridge/feature/modeSelector/widget/user_role.dart';

final roleNotifierProvider = AsyncNotifierProvider<RoleNotifier, UserRole>(
  RoleNotifier.new,
);

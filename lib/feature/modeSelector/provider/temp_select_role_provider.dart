import 'package:flutter_riverpod/legacy.dart';
import 'package:skill_bridge/core/enums/user_role.dart';

final selectRoleProvider = StateProvider<UserRole>((ref) {
  return UserRole.unselected;
});

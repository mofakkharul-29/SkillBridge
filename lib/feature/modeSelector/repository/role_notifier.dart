import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skill_bridge/feature/modeSelector/widget/user_role.dart';

class RoleNotifier extends AsyncNotifier<UserRole> {
  late SharedPreferences _pre;

  @override
  Future<UserRole> build() async {
    _pre = await SharedPreferences.getInstance();
    final String? userString = _pre.getString('userRole');
    final role = UserRole.values.firstWhere(
      (e) => e.name == userString,
      orElse: () => UserRole.unselected,
    );
    return role;
  }

  Future<void> setUserRole(UserRole value) async {
    try {
      await _pre.setString('userRole', value.name);
      state = AsyncData(value);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

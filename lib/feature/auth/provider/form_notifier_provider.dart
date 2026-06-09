import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_bridge/feature/auth/data/auth_form_notifier.dart';
import 'package:skill_bridge/feature/auth/data/auth_form_state.dart';

final formNotifierProvider = NotifierProvider<AuthFormNotifier, AuthFormState>(
  AuthFormNotifier.new,
);

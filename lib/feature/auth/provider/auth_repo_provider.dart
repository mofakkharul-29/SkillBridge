import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_bridge/feature/auth/data/repository/auth_repository.dart';
import 'package:skill_bridge/feature/auth/provider/auth_instance_provider.dart';

final authRepoProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(auth: ref.watch(authInstanceProvider)),
);

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_bridge/feature/auth/data/repository/auth_repository/auth_repo.dart';

final authRepoProvider = Provider<AuthRepo>((ref) {
  return AuthRepo(FirebaseAuth.instance);
});

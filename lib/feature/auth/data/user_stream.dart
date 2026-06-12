import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_bridge/feature/auth/data/repository/user_repository.dart';
import 'package:skill_bridge/feature/auth/model/app_user.dart';
import 'package:skill_bridge/feature/auth/provider/auth_instance_provider.dart';
import 'package:skill_bridge/feature/auth/provider/user_repo_provider.dart';

class UserStreamNotifier extends StreamNotifier<AppUser> {
  late UserRepository _userRepository;
  late FirebaseAuth _auth;

  @override
  Stream<AppUser> build() {
    _userRepository = ref.watch(userRepoProvider);
    _auth = ref.watch(authInstanceProvider);
    return _userRepository.watchUser(id: _auth.currentUser!.uid);
  }
}

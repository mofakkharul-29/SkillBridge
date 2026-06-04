import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_bridge/feature/auth/data/repository/user_repository/user_repo.dart';

final userRepoProvider = Provider<UserRepo>(
  (ref) => UserRepo(FirebaseFirestore.instance),
);

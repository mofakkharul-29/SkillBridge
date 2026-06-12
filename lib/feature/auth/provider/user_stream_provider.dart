import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_bridge/feature/auth/data/user_stream.dart';
import 'package:skill_bridge/feature/auth/model/app_user.dart';

final userStreamProvider = StreamNotifierProvider<UserStreamNotifier, AppUser>(
  UserStreamNotifier.new,
);

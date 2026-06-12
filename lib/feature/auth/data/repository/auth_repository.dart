import 'package:firebase_auth/firebase_auth.dart';
import 'package:skill_bridge/core/enums/user_role.dart';
import 'package:skill_bridge/feature/auth/model/app_user.dart';

class AuthRepository {
  final FirebaseAuth _auth;

  // ignore: prefer_initializing_formals
  AuthRepository({required FirebaseAuth auth}) : _auth = auth;

  Future<AppUser> registerWithEmailPassword({
    required String email,
    required String password,
    required UserRole role,
    required String fullName,
    required String phoneNumber,
  }) async {
    try {
      final UserCredential credential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      final User? user = credential.user;
      if (user == null) {
        throw Exception('account creation failed!');
      }
      await user.updateDisplayName(fullName);

      final AppUser appUser = AppUser(
        uid: user.uid,
        fullName: fullName,
        email: email,
        role: role,
        phoneNumber: phoneNumber,
        photoUrl: user.photoURL,
        createdAt: DateTime.now(),
      );
      return appUser;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = credential.user;
      if (user == null) {
        throw Exception('log in failed!');
      }
      return user.uid;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    } catch (e) {
      throw Exception(e);
    }
  }
}

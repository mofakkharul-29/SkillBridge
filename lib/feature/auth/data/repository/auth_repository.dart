import 'package:firebase_auth/firebase_auth.dart';
import 'package:skill_bridge/core/enums/user_role.dart';
import 'package:skill_bridge/core/exceptions/auth_exception.dart';
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
      if (user == null) throw AuthException.userCreationFailed();

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
      throw _mapFirebaseAuthException(e);
    } on AuthException {
      rethrow;
    } catch (e) {
      throw AuthException.unknown(e.toString());
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
        // throw AuthException.userCreationFailed();
        throw AuthException.userNotFound();
      }
      return user.uid;
    } on FirebaseAuthException catch (e) {
      throw _mapFirebaseAuthException(e);
    } on AuthException {
      rethrow;
    } catch (e) {
      throw AuthException.unknown(e.toString());
    }
  }

  AuthException _mapFirebaseAuthException(FirebaseAuthException e) {
    return switch (e.code) {
      'email-already-in-use' => AuthException.emailAlreadyInUse(),
      'invalid-credential' => AuthException.invalidCredential(),
      'user-not-found' => AuthException.userNotFound(),
      'weak-password' => AuthException.weakPassword(),
      'network-request-failed' => AuthException.networkError(),
      _ => AuthException.unknown(e.code),
    };
  }
}

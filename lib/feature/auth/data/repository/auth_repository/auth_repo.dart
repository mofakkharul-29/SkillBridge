import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skill_bridge/core/enums/user_role.dart';
import 'package:skill_bridge/feature/auth/exceptions/auth_repo_exception.dart';
import 'package:skill_bridge/feature/auth/model/app_user.dart';

class AuthRepo {
  final FirebaseAuth _auth;

  const AuthRepo(this._auth);

  Future<AppUser> registerWithEmailPassword({
    required String email,
    required String password,
    required String fullName,
    required UserRole role,
    required String phoneNumber,
  }) async {
    try {
      final UserCredential credential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      final User? user = credential.user;
      if (user == null) {
        throw AuthRepoException(
          code: 'user-creation-failed',
          message: 'User creation returned null',
        );
      }

      await user.updateDisplayName(fullName);

      return AppUser(
        uid: user.uid,
        fullName: fullName,
        email: email,
        role: role,
        phoneNumber: phoneNumber,
        photoUrl: null,
        createdAt: DateTime.now(),
      );
    } on AuthRepoException {
      rethrow;
    } on FirebaseAuthException catch (e) {
      throw AuthRepoException(code: e.code, message: e.message ?? '');
    } catch (e) {
      throw AuthRepoException(code: 'unknown', message: e.toString());
    }
  }

  Future<String?> loginWithEmailPassword({
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
        throw AuthRepoException(
          code: 'firebase-user-null',
          message: 'Login returned null user',
        );
      }

      return user.uid;
    } on AuthRepoException {
      rethrow;
    } on FirebaseAuthException catch (e) {
      throw AuthRepoException(code: e.code, message: e.message ?? '');
    } catch (e) {
      throw AuthRepoException(code: 'unknown', message: e.toString());
    }
  }

  Future<String> loginWithGoogle() async {
    try {
      final GoogleSignIn googleSignInInstance = GoogleSignIn.instance;

      final List<String> scopes = ['email', 'profile'];

      final GoogleSignInAccount googleUser = await googleSignInInstance
          .authenticate();

      final GoogleSignInClientAuthorization clientAuth = await googleUser
          .authorizationClient
          .authorizeScopes(scopes);

      final String? idToken = googleUser.authentication.idToken;
      if (idToken == null) {
        throw AuthRepoException(
          code: 'id-token-missing',
          message: 'Google idToken was null',
        );
      }

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: clientAuth.accessToken,
        idToken: idToken,
      );
      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      final User? user = userCredential.user;
      if (user == null) {
        throw AuthRepoException(
          code: 'firebase-user-null',
          message: 'Google sign in returned null user',
        );
      }

      return user.uid;
    } on AuthRepoException {
      rethrow;
    } on FirebaseAuthException catch (e) {
      throw AuthRepoException(code: e.code, message: e.message ?? '');
    } catch (e) {
      throw AuthRepoException(code: 'unknown', message: e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await Future.wait([_auth.signOut(), GoogleSignIn.instance.signOut()]);
    } on FirebaseAuthException catch (e) {
      throw AuthRepoException(code: e.code, message: e.message ?? '');
    } catch (e) {
      throw AuthRepoException(code: 'unknown', message: e.toString());
    }
  }

  Future<String> deleteAccount() async {
    try {
      final uid = _auth.currentUser?.uid;
      if (uid == null) {
        throw AuthRepoException(
          code: 'no-current-user',
          message: 'No authenticated user found',
        );
      }
      await _auth.currentUser!.delete();
      return uid;
    } on AuthRepoException {
      rethrow;
    } on FirebaseAuthException catch (e) {
      throw AuthRepoException(code: e.code, message: e.message ?? '');
    } catch (e) {
      throw AuthRepoException(code: 'unknown', message: e.toString());
    }
  }
}

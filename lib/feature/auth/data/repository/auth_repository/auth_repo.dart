import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skill_bridge/core/enums/user_role.dart';
import 'package:skill_bridge/feature/auth/model/app_user.dart';

class AuthRepo {
  final FirebaseAuth _auth;

  const AuthRepo(this._auth);

  Future<AppUser?> registerWithEmailPassword({
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
        throw Exception('user-creation-failed');
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
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
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
        throw Exception('login-failed');
      }

      return user.uid;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
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
      if (idToken == null) throw Exception('id-token-missing');

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: clientAuth.accessToken,
        idToken: idToken,
      );
      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      final User? user = userCredential.user;
      if (user == null) throw Exception('firebase-user-null');

      return user.uid;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signOut() async {
    try {
      await Future.wait([_auth.signOut(), GoogleSignIn.instance.signOut()]);
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> deleteAccount() async {
    try {
      final uid = _auth.currentUser?.uid;
      if (uid == null) throw Exception('there is no such user');
      await _auth.currentUser!.delete();
      return uid;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skill_bridge/feature/auth/exceptions/user_repo_exception.dart';
import 'package:skill_bridge/feature/auth/model/app_user.dart';

class UserRepo {
  final FirebaseFirestore _firestore;

  const UserRepo(this._firestore);

  DocumentReference<Map<String, dynamic>> _userDoc(String uid) =>
      _firestore.collection('users').doc(uid);

  Future<void> createUser(AppUser user) async {
    try {
      await _userDoc(user.uid).set(user.toCreateMap());
    } on FirebaseException catch (e) {
      throw UserRepoException(code: e.code, message: e.message ?? '');
    } catch (e) {
      throw UserRepoException(code: 'unknown', message: e.toString());
    }
  }

  Future<AppUser> fetchUser(String uid) async {
    try {
      final doc = await _userDoc(uid).get();

      if (!doc.exists || doc.data() == null) {
        throw UserRepoException(
          code: 'user-not-found',
          message: 'User document does not exist',
        );
      }

      return AppUser.fromMap(doc.data()!);
    } on UserRepoException {
      rethrow;
    } on FirebaseException catch (e) {
      throw UserRepoException(code: e.code, message: e.message ?? '');
    } catch (e) {
      throw UserRepoException(code: 'unknown', message: e.toString());
    }
  }

  Future<void> updateUser(AppUser user) async {
    try {
      await _userDoc(user.uid).update(user.toMap());
    } on FirebaseException catch (e) {
      throw UserRepoException(code: e.code, message: e.message ?? '');
    } catch (e) {
      throw UserRepoException(code: 'unknown', message: e.toString());
    }
  }

  Future<void> deleteUser(String uid) async {
    try {
      await _userDoc(uid).delete();
    } on FirebaseException catch (e) {
      throw UserRepoException(code: e.code, message: e.message ?? '');
    } catch (e) {
      throw UserRepoException(code: 'unknown', message: e.toString());
    }
  }

  Stream<AppUser> watchUser(String uid) {
    return _userDoc(uid).snapshots().map((doc) {
      if (!doc.exists || doc.data() == null) {
        throw UserRepoException(
          code: 'user-not-found',
          message: 'User document does not exist',
        );
      }
      return AppUser.fromMap(doc.data()!);
    });
  }
}

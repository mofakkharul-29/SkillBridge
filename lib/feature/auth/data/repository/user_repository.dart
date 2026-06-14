import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skill_bridge/core/exceptions/user_exception.dart';
import 'package:skill_bridge/feature/auth/model/app_user.dart';

class UserRepository {
  final FirebaseFirestore _firebaseFirestore;

  UserRepository({required FirebaseFirestore firestore})
    : _firebaseFirestore = firestore;

  DocumentReference refToDocument(String uid) {
    return _firebaseFirestore.collection('users').doc(uid);
  }

  Future<void> writeUser({required AppUser user}) async {
    try {
      final ref = refToDocument(user.uid);
      await ref.set(user.toCreateMap(), SetOptions(merge: true));
    } on FirebaseException catch (e) {
      throw _mapFirebaseException(e, fallback: UserException.writeFailed());
    } catch (e) {
      throw UserException.unknown(e.toString());
    }
  }

  Future<AppUser> readUser({required String uid}) async {
    try {
      final ref = refToDocument(uid);
      final snapshot = await ref.get();
      if (!snapshot.exists || snapshot.data() == null) {
        throw UserException.notFound();
      }

      final userData = snapshot.data() as Map<String, dynamic>;
      return AppUser.fromMap(userData);
    } on FirebaseException catch (e) {
      throw _mapFirebaseException(e, fallback: UserException.unknown(e.code));
    } on UserException {
      rethrow;
    } catch (e) {
      throw UserException.unknown(e.toString());
    }
  }

  Stream<AppUser> watchUser({required String id}) {
    return refToDocument(id).snapshots().map((snp) {
      if (!snp.exists || snp.data() == null) throw UserException.notFound();
      return AppUser.fromMap(snp.data() as Map<String, dynamic>);
    });
  }

  UserException _mapFirebaseException(
    FirebaseException e, {
    required UserException fallback,
  }) {
    return switch (e.code) {
      'unavailable' || 'network-request-failed' => UserException.networkError(),
      _ => fallback,
    };
  }
}

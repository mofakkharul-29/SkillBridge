import 'package:cloud_firestore/cloud_firestore.dart';
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
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<AppUser> readUser({required String uid}) async {
    try {
      final ref = refToDocument(uid);
      final snapshot = await ref.get();
      final userData = snapshot.data() as Map<String, dynamic>;
      return AppUser.fromMap(userData);
    } on FirebaseException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  Stream<AppUser> watchUser({required String id}) {
    return refToDocument(id).snapshots().map(
      (snp) => AppUser.fromMap(snp.data() as Map<String, dynamic>),
    );
  }
}

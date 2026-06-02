import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skill_bridge/core/enums/user_role.dart';

class AppUser {
  final String uid;
  final String fullName;
  final String email;
  final UserRole role;
  final String phoneNumber;
  final String? photoUrl;
  final DateTime createdAt;

  const AppUser({
    required this.uid,
    required this.fullName,
    required this.email,
    required this.role,
    required this.phoneNumber,
    this.photoUrl,
    required this.createdAt,
  });

  //reading from firestore creating new
  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: map['uid'] as String,
      fullName: map['fullName'] as String,
      email: map['email'] as String,
      role: UserRole.values.firstWhere(
        (r) => r.name == map['role'],
        orElse: () => UserRole.unselected,
      ),
      photoUrl: map['photoUrl'] as String?,
      phoneNumber: map['phoneNumber'] as String,
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  // update to user information
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'email': email,
      'role': role.name,
      'phoneNumber': phoneNumber,
      'photoUrl': photoUrl,
    };
  }

  // For initial registration ONLY — sets createdAt once via server
  Map<String, dynamic> toCreateMap() {
    return {
      ...toMap(),
      'createdAt':
          FieldValue.serverTimestamp(),
    };
  }

  //for in memory state update
  AppUser copyWith({
    String? uid,
    String? fullName,
    String? email,
    UserRole? role,
    String? phoneNumber,
    String? photoUrl,
    DateTime? createdAt,
  }) {
    return AppUser(
      uid: uid ?? this.uid,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      role: role ?? this.role,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoUrl: photoUrl ?? this.photoUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

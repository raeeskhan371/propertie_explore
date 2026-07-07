import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final String email;

  final String role;
  final Timestamp? createdAt;

  UserModel({
    required this.name,
    required this.email,
    required this.role,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "role": role,
      "createdAt": FieldValue.serverTimestamp(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map["name"] ?? "",
      email: map["email"] ?? "",
      role: map["role"] ?? "",
      createdAt: (map["createdAt"] as Timestamp),
    );
  }
}

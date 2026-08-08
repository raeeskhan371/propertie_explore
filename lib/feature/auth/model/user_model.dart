import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final String email;
  final String contactNumber;
  final String role;
  final String? imageUrl;
  final Timestamp? createdAt;
  final String? fcmToken;

  UserModel({
    required this.name,
    required this.email,
    required this.role,
    required this.contactNumber,
    this.fcmToken,
    this.imageUrl,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "role": role,
      "contactNumber": contactNumber,
      "imageUrl": imageUrl,
      "fcmToken": fcmToken,
      "createdAt": FieldValue.serverTimestamp(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map["name"] ?? "",
      email: map["email"] ?? "",
      contactNumber: map["contactNumber"] ?? "",
      role: map["role"] ?? "",
      imageUrl: map["imageUrl"] ?? " no pic uplaoded",
      fcmToken: map["fcmToken"],
      createdAt: map["createdAt"] as Timestamp?,
    );
  }
}

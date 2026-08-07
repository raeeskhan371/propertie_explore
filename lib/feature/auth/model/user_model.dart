import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final String email;
  final String contact;
  final String role;
  final String? imageUrl;
  final Timestamp? createdAt;
  String? Token;

  UserModel({
    required this.name,
    required this.email,
    required this.role,
    required this.contact,
    this.Token,
    this.imageUrl,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "role": role,
      "contactNumber": contact,
      "imageUrl": imageUrl,
      "fcmToken": Token,
      "createdAt": FieldValue.serverTimestamp(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map["name"] ?? "",
      email: map["email"] ?? "",
      contact: map["contactNumber"] ?? "",
      role: map["role"] ?? "",

      imageUrl: map["imageUrl"] ?? " no pic uplaoded",
      createdAt: (map["createdAt"] as Timestamp),
    );
  }
}

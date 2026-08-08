import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteModel {
  final String propertyId;
  final Timestamp? createdAt;

  FavoriteModel({required this.propertyId, this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      "propertyId": propertyId,
      "createdAt": createdAt ?? Timestamp.now(),
    };
  }

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      propertyId: map["propertyId"] ?? "",
      createdAt: map["createdAt"],
    );
  }
}

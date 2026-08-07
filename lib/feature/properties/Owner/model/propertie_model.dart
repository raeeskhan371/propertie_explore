import 'package:cloud_firestore/cloud_firestore.dart';

class PropertieModel {
  final String ownerName;
  final String profileImageUrl;
  final String? searchTitle;
  final String title;
  final List<String> propertyImageUrls;
  final String propertyType;
  final double area;
  final double price;
  final int bed;
  final int bath;
  final String location;
  final String description;
  final String? contact;
  final String? id;
  final String? ownerID;
  Timestamp? createdAt;

  PropertieModel({
    required this.ownerName,
    required this.profileImageUrl,
    required this.title,
    this.searchTitle,
    required this.propertyImageUrls,
    required this.propertyType,
    required this.area,
    required this.price,
    this.contact,
    required this.bed,
    required this.bath,
    required this.location,
    required this.description,
    this.createdAt,
    this.id,
    this.ownerID,
  });

  Map<String, dynamic> toMap() {
    return {
      "ownerName": ownerName,
      "profileImageUrl": profileImageUrl,

      "title": title,
      "searchTitle": title.toLowerCase(),
      "imageUrls": propertyImageUrls,
      "propertyType": propertyType,
      "area": area,
      "price": price,
      "contactNumber": contact,
      "bed": bed,
      "bath": bath,
      "location": location,
      "description": description,
      "createdAt": FieldValue.serverTimestamp(),
      "ownerID": ownerID,
    };
  }

  factory PropertieModel.fromMap(Map<String, dynamic> map, String? ID) {
    return PropertieModel(
      ownerName: map["ownerName"] ?? "",
      profileImageUrl: map["profileImageUrl"] ?? "",
      title: map["title"] ?? "",
      propertyImageUrls: List<String>.from(map["imageUrls"] ?? []),
      propertyType: map["propertyType"],
      area: (map["area"] as num).toDouble(),
      price: (map["price"] as num).toDouble(),
      contact: map["contactNumber"] ?? "",
      bed: map["bed"],
      bath: map["bath"],
      location: map["location"],
      description: map["description"] ?? "",
      createdAt: map["createdAt"] as Timestamp?,
      id: ID ?? "",
      ownerID: map["ownerID"] ?? "",
    );
  }
}

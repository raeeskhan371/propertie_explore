import 'package:cloud_firestore/cloud_firestore.dart';

class PropertieModel {
  final String? id;
  final String title;
  final String propertyType;
  final double area;
  final double price;
  final int bed;
  final int bath;
  final String location;
  final String description;
  Timestamp? createdAt;

  PropertieModel({
    required this.title,
    required this.propertyType,
    required this.area,
    required this.price,
    required this.bed,
    required this.bath,
    required this.location,
    required this.description,
    this.createdAt,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "propertyType": propertyType,
      "price": price,
      "bed": bed,
      "bath": bath,
      "location": location,
      "description": description,
      "createdAt": FieldValue.serverTimestamp(),
    };
  }

  factory PropertieModel.fromMap(Map<String, dynamic> map, String ID) {
    return PropertieModel(
      title: map["title"],
      propertyType: map["propertyType"],
      area: map["area"],
      price: map["price"],
      bed: map["bed"],
      bath: map["bath"],
      location: map["location"],
      description: map["description"],
      createdAt: map["createdAt"] as Timestamp,
      id: ID,
    );
  }
}

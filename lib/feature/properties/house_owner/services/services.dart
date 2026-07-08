import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:propertie_explore/feature/properties/house_owner/model/propertie_model.dart';

class PropertyServices {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addProperty({
    required String ownerName,
    required String title,
    required String propertyType,
    required double area,
    required double price,
    required int bed,
    required int bath,
    required String location,
    required String description,
  }) async {
    final uid = await _auth.currentUser!.uid;

    final propertyModel = PropertieModel(
      ownerName: ownerName,
      title: title,
      propertyType: propertyType,
      area: area,
      price: price,
      bed: bed,
      bath: bath,
      location: location,
      description: description,
      ownerID: uid,
    );

    await _firestore.collection("properties").doc().set(propertyModel.toMap());
  }
}

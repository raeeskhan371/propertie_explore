import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:propertie_explore/feature/properties/house_owner/model/propertie_model.dart';

class PropertyServices {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addProperty({
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
    final repo = await _firestore.collection("Users").doc(uid);
    final propertyRepo = await repo.collection("property").doc();
    final propertyModel = PropertieModel(
      title: title,
      propertyType: propertyType,
      area: area,
      price: price,
      bed: bed,
      bath: bath,
      location: location,
      description: description,
    );

    await propertyRepo.set(propertyModel.toMap());
  }
}

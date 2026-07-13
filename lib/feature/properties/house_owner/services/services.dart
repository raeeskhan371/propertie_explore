import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:propertie_explore/feature/auth/model/user_model.dart';
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
  // fetching Owner Properties

  Stream<List<PropertieModel>> fetchingOwnerProperties() {
    final uid = _auth.currentUser!.uid;

    final data = _firestore
        .collection("properties")
        .where("ownerID", isEqualTo: uid)
        .snapshots();

    return data.map((snapshot) {
      return snapshot.docs.map((doc) {
        return PropertieModel.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

  // Edit Property

  Future<void> UpdateProperty({
    required String ownerName,
    required String title,
    required String propertyType,
    required double area,
    required double price,
    required int bed,
    required int bath,
    required String location,
    required String description,
    required String id,
    required String ownerID,
  }) async {
    final uid = _auth.currentUser!.uid;
    final propertie = PropertieModel(
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
    await _firestore.collection("properties").doc(id).update(propertie.toMap());
  }

  // Delete Funnction

  Future<void> deleteProperty({required String id}) async {
    final uid = _auth.currentUser!.uid;

    final Repo = _firestore.collection("properties").doc(id).delete();
  }

  Future<UserModel> userFetching() async {
    final uid = _auth.currentUser!.uid;
    final result = await _firestore.collection("Users").doc(uid).get();
    return UserModel.fromMap(result.data()!);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:propertie_explore/feature/properties/house_owner/model/propertie_model.dart';

class CustomerServices {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<PropertieModel>> fetchingProperties() {
    final data = _firestore
        .collection("properties")
        .orderBy("createdAt", descending: true)
        .snapshots();

    return data.map((snapshot) {
      return snapshot.docs.map((doc) {
        return PropertieModel.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }
}

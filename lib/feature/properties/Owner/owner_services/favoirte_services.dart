import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:propertie_explore/feature/properties/Owner/model/favourite_model.dart';
import 'package:propertie_explore/feature/properties/Owner/model/propertie_model.dart';

class FavouriteServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  //add Favuirte Function

  Future<void> addFavorite(String id) async {
    final uid = _auth.currentUser?.uid;
    final favouriteModel = FavoriteModel(propertyId: id);

    _firestore
        .collection("Users")
        .doc(uid)
        .collection("Favorites")
        .doc(id)
        .set(favouriteModel.toMap());
  }

  // get getFavoriteProperties

  Future<List<PropertieModel>> getFavoriteProperties() async {
    final uid = _auth.currentUser?.uid;

    final favoriteSnapshot = await _firestore
        .collection("Users")
        .doc(uid)
        .collection("Favorites")
        .get();

    final ids = favoriteSnapshot.docs.map((doc) {
      return doc.data()["propertyId"] as String;
    }).toList();

    if (ids.isEmpty) {
      return [];
    }

    final propertySnapshot = await _firestore
        .collection("properties")
        .where(FieldPath.documentId, whereIn: ids)
        .get();

    debugPrint(" Favourit Service Length: ${propertySnapshot.docs.length}");

    return propertySnapshot.docs
        .map((doc) => PropertieModel.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<void> removeFavuoirte(String id) async {
    final uid = _auth.currentUser?.uid;
    await _firestore
        .collection("Users")
        .doc(uid)
        .collection("Favorites")
        .doc(id)
        .delete();
  }
}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:propertie_explore/feature/auth/model/user_model.dart';
import 'package:propertie_explore/feature/auth/services/auth_services.dart';
import 'package:propertie_explore/feature/properties/Owner/model/propertie_model.dart';
import 'package:propertie_explore/feature/properties/Owner/services/owner_cloudnary_services.dart';

class OwnerPropertyServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final OwnerCloudnaryServices _cloudinaryService = OwnerCloudnaryServices();
  final AuthFireBaseServices _authFireBaseServices = AuthFireBaseServices();

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
    // this file is image file which is provided by user
    required List<File> imageFile,
  }) async {
    debugPrint("[ExplorePropertyApp](Firestore) addProperty() Called");
    final uid = await _auth.currentUser!.uid;
    // in this imageUrl is store of cloudnaryservices url whihc soon provided to firebase to store
    // imageFIle is comefrom user and this function conver image into url

    final List<String> ImageUrl = await _cloudinaryService.uploadImages(
      imageFile,
    );

    // getting data form userCollectioon Name , image url

    final userDoc = await _firestore.collection("Users").doc(uid).get();

    final data = userDoc.data() as Map<String, dynamic>;

    final String userName = data["name"];
    final String profileImageUrl = data["imageUrl"];

    final propertyModel = PropertieModel(
      ownerName: userName,
      profileImageUrl: profileImageUrl,
      title: title,
      propertyType: propertyType,
      area: area,
      price: price,
      bed: bed,
      bath: bath,
      location: location,
      description: description,
      ownerID: uid,
      // this  is  the imageurl provided by cloudnary services
      propertyImageUrls: ImageUrl,
    );

    await _firestore.collection("properties").doc().set(propertyModel.toMap());
  }
  // fetching Owner Properties

  Stream<List<PropertieModel>> fetchingOwnerProperties() {
    debugPrint(
      "[ExplorePropertyApp](Firestore) fetchingOwnerProperties() Called",
    );
    try {
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
    } on FirebaseException catch (e) {
      switch (e.code) {
        case "permission-denied":
          throw Exception("You don't have permission to access this data.");

        case "unavailable":
          throw Exception("Internet connection issue. Please try again.");

        case "not-found":
          throw Exception("Requested data was not found.");

        case "deadline-exceeded":
          throw Exception("Request took too long. Please try again.");

        case "cancelled":
          throw Exception("Request was cancelled.");

        case "failed-precondition":
          throw Exception("This operation cannot be completed right now.");

        case "aborted":
          throw Exception("Operation was interrupted. Please try again.");

        case "resource-exhausted":
          throw Exception("Too many requests. Please try again later.");

        case "already-exists":
          throw Exception("Data already exists.");

        case "invalid-argument":
          throw Exception("Invalid data provided.");

        case "unauthenticated":
          throw Exception("Please login again.");

        case "internal":
          throw Exception("Server error. Please try again.");

        case "data-loss":
          throw Exception("Unexpected data error occurred.");

        default:
          throw Exception(
            e.message ?? "Something went wrong while fetching data.",
          );
      }
    }
  }

  // fetching All OwnerProperties

  Stream<List<PropertieModel>> allUserDataFetchingProperties() {
    debugPrint(
      "[ExplorePropertyApp](Firestore) allUserDataFetchingProperties() Called",
    );
    try {
      final data = _firestore
          .collection("properties")
          .orderBy("createdAt", descending: true)
          .snapshots();

      return data.map((snapshot) {
        return snapshot.docs.map((doc) {
          return PropertieModel.fromMap(doc.data(), doc.id);
        }).toList();
      });
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "permission-denied":
          throw Exception("You don't have permission to access this data.");

        case "unavailable":
          throw Exception("Internet connection issue. Please try again.");

        case "not-found":
          throw Exception("Requested data was not found.");

        case "deadline-exceeded":
          throw Exception("Request took too long. Please try again.");

        case "cancelled":
          throw Exception("Request was cancelled.");

        case "failed-precondition":
          throw Exception("This operation cannot be completed right now.");

        case "aborted":
          throw Exception("Operation was interrupted. Please try again.");

        case "resource-exhausted":
          throw Exception("Too many requests. Please try again later.");

        case "already-exists":
          throw Exception("Data already exists.");

        case "invalid-argument":
          throw Exception("Invalid data provided.");

        case "unauthenticated":
          throw Exception("Please login again.");

        case "internal":
          throw Exception("Server error. Please try again.");

        case "data-loss":
          throw Exception("Unexpected data error occurred.");

        default:
          throw Exception(
            e.message ?? "Something went wrong while fetching data.",
          );
      }
    }
  }

  // Edit Property

  Future<void> UpdateProperty({
    required String title,
    required String propertyType,
    required double area,
    required double price,
    required int bed,
    required int bath,
    required String location,
    required String description,
    required String id,

    required List<File> imageFile,
    required List<String> oldImages,
  }) async {
    debugPrint("[ExplorePropertyApp](Firestore) updateProperty() Called");
    try {
      final uid = _auth.currentUser?.uid;

      // getting data form userCollectioon Name , image url

      final userDoc = await _firestore.collection("Users").doc(uid).get();

      final data = userDoc.data() as Map<String, dynamic>;

      final String userName = data["name"];
      final String profileImageUrl = data["imageUrl"];

      List<String> propertyImages;

      if (imageFile.isNotEmpty) {
        propertyImages = await _cloudinaryService.uploadImages(imageFile);
      } else {
        propertyImages = oldImages;
      }

      final propertie = PropertieModel(
        ownerName: userName,
        profileImageUrl: profileImageUrl,
        title: title,
        propertyType: propertyType,
        area: area,
        price: price,
        bed: bed,
        bath: bath,
        location: location,
        description: description,
        ownerID: uid,
        propertyImageUrls: propertyImages,
      );
      await _firestore
          .collection("properties")
          .doc(id)
          .update(propertie.toMap());
    } on FirebaseException catch (e) {
      switch (e.code) {
        case "permission-denied":
          throw Exception("You don't have permission to access this data.");

        case "unavailable":
          throw Exception("Internet connection issue. Please try again.");

        case "not-found":
          throw Exception("Requested data was not found.");

        case "deadline-exceeded":
          throw Exception("Request took too long. Please try again.");

        case "cancelled":
          throw Exception("Request was cancelled.");

        case "failed-precondition":
          throw Exception("This operation cannot be completed right now.");

        case "aborted":
          throw Exception("Operation was interrupted. Please try again.");

        case "resource-exhausted":
          throw Exception("Too many requests. Please try again later.");

        case "already-exists":
          throw Exception("Data already exists.");

        case "invalid-argument":
          throw Exception("Invalid data provided.");

        case "unauthenticated":
          throw Exception("Please login again.");

        case "internal":
          throw Exception("Server error. Please try again.");

        case "data-loss":
          throw Exception("Unexpected data error occurred.");

        default:
          throw Exception(
            e.message ?? "Something went wrong while fetching data.",
          );
      }
    }
  }

  // Delete Funnction

  Future<void> deleteProperty({required String id}) async {
    debugPrint("[ExplorePropertyApp](Firestore) deleteProperty() Called");

    try {
      final uid = _auth.currentUser!.uid;

      final Repo = _firestore.collection("properties").doc(id).delete();
    } on FirebaseException catch (e) {
      switch (e.code) {
        case "permission-denied":
          throw Exception("You don't have permission to access this data.");

        case "unavailable":
          throw Exception("Internet connection issue. Please try again.");

        case "not-found":
          throw Exception("Requested data was not found.");

        case "deadline-exceeded":
          throw Exception("Request took too long. Please try again.");

        case "cancelled":
          throw Exception("Request was cancelled.");

        case "failed-precondition":
          throw Exception("This operation cannot be completed right now.");

        case "aborted":
          throw Exception("Operation was interrupted. Please try again.");

        case "resource-exhausted":
          throw Exception("Too many requests. Please try again later.");

        case "already-exists":
          throw Exception("Data already exists.");

        case "invalid-argument":
          throw Exception("Invalid data provided.");

        case "unauthenticated":
          throw Exception("Please login again.");

        case "internal":
          throw Exception("Server error. Please try again.");

        case "data-loss":
          throw Exception("Unexpected data error occurred.");

        default:
          throw Exception(
            e.message ?? "Something went wrong while fetching data.",
          );
      }
    }
  }

  Future<UserModel> userFetching() async {
    debugPrint("[ExplorePropertyApp](Firestore) userFetching() Called");
    try {
      final uid = _auth.currentUser!.uid;
      final result = await _firestore.collection("Users").doc(uid).get();
      return UserModel.fromMap(result.data()!);
    } on FirebaseException catch (e) {
      switch (e.code) {
        case "permission-denied":
          throw Exception("You don't have permission to access this data.");

        case "unavailable":
          throw Exception("Internet connection issue. Please try again.");

        case "not-found":
          throw Exception("Requested data was not found.");

        case "deadline-exceeded":
          throw Exception("Request took too long. Please try again.");

        case "cancelled":
          throw Exception("Request was cancelled.");

        case "failed-precondition":
          throw Exception("This operation cannot be completed right now.");

        case "aborted":
          throw Exception("Operation was interrupted. Please try again.");

        case "resource-exhausted":
          throw Exception("Too many requests. Please try again later.");

        case "already-exists":
          throw Exception("Data already exists.");

        case "invalid-argument":
          throw Exception("Invalid data provided.");

        case "unauthenticated":
          throw Exception("Please login again.");

        case "internal":
          throw Exception("Server error. Please try again.");

        case "data-loss":
          throw Exception("Unexpected data error occurred.");

        default:
          throw Exception(
            e.message ?? "Something went wrong while fetching data.",
          );
      }
    }
  }
}

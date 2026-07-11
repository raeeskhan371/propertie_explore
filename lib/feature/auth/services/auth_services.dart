import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:propertie_explore/feature/auth/model/user_model.dart';
import 'package:propertie_explore/feature/properties/customer/screens/property_overview_screen.dart';
import 'package:propertie_explore/feature/properties/house_owner/screens/bottom_bar.dart';
import 'package:propertie_explore/feature/properties/house_owner/screens/my_properties_screen.dart';

class AuthFireBaseServices {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Create User Fucntion

  Future<void> userSinup({
    required String name,
    required String email,
    required String password,
    required String role,
  }) async {
    // user Create
    final UserCredential userCredential = await _auth
        .createUserWithEmailAndPassword(email: email, password: password);

    final uid = userCredential.user!.uid;

    // saving data in firestore (Save Data in Database)

    final user = UserModel(name: name, email: email, role: role);

    _firestore.collection("Users").doc(uid).set(user.toMap());
  }

  // Login User  With Cheack Condition

  Future<void> userLogin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);

    final uid = _auth.currentUser!.uid;

    // Read Data for Cheacking Role

    final data = await _firestore.collection("Users").doc(uid).get();

    String Role = data.data()!["role"];

    if (Role == "houseOwner") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => BottomBar()),
      );
    } else if (Role == "customer") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => PropertyOverviewScreen()),
      );
    }
  }
}

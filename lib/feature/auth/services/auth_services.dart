import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:propertie_explore/feature/auth/model/user_model.dart';

class AuthFireBaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Create User Fucntion

  Future<void> userSinup({
    required String name,
    required String email,
    required String password,
    required String role,
  }) async {
    // user Create
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      final uid = userCredential.user!.uid;

      // saving data in firestore (Save Data in Database)

      final user = UserModel(name: name, email: email, role: role);

      await _firestore.collection("Users").doc(uid).set(user.toMap());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          throw Exception("This email is already registered.");

        case "invalid-email":
          throw Exception("Please enter a valid email address.");

        case "weak-password":
          throw Exception("Password should be at least 6 characters long.");

        case "network-request-failed":
          throw Exception("Please check your internet connection.");

        default:
          throw Exception("Unable to create your account. Please try again.");
      }
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? "Failed User Data");
    }
  }

  // Login User  With Cheack Condition

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          throw Exception("Please enter a valid email address.");

        case "invalid-credential":
          throw Exception("Invalid email or password.");

        case "user-disabled":
          throw Exception("This account has been disabled.");

        case "network-request-failed":
          throw Exception("Please check your internet connection.");

        case "too-many-requests":
          throw Exception("Too many login attempts. Please try again later.");

        case "operation-not-allowed":
          throw Exception("Email/Password sign-in is not enabled.");

        default:
          throw Exception("Login failed. Please try again.");
      }
    }
  }

  // User Logout

  Future<void> userLogout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception("Faield to Logout");
    }
  }

  Future<String> userCheck() async {
    try {
      final uid = _auth.currentUser!.uid;

      final data = await _firestore.collection("Users").doc(uid).get();
      if (!data.exists) {
        throw Exception("user not found");
      }

      return await data.data()!["role"];
    } on FirebaseException catch (e) {
      switch (e.code) {
        case "permission-denied":
          throw Exception("Permission denied.");

        case "unavailable":
          throw Exception("Database is unavailable.");

        default:
          throw Exception(e.message ?? "Failed to fetch user data.");
      }
    } catch (e) {
      throw Exception("something  went wrong");
    }
  }
}

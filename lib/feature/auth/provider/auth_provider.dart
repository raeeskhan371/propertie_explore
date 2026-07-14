// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:propertie_explore/feature/auth/services/auth_services.dart';

// class AuthProvider with ChangeNotifier {
//   bool _isLoading = false;
//   bool get isLoading => _isLoading;

//   void loading(bool value) {
//     _isLoading = value;
//   }

//   Future<void> userSingUp({
//     required String name,
//     required String email,
//     required String password,
//     required String role,
//   }) async {
//     final AuthFireBaseServices _auth = AuthFireBaseServices();

//     try {
//       loading(true);
//       notifyListeners();

//       await _auth.userSinup(
//         name: name,
//         email: email,
//         password: password,
//         role: role,
//       );
//     }  FirebaseAuthException (e) {}
//   }
// }

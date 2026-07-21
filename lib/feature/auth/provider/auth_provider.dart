import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:propertie_explore/feature/auth/services/auth_image_picker_services.dart';
import 'package:propertie_explore/feature/auth/services/auth_services.dart';
import 'package:propertie_explore/feature/properties/Owner/services/owner_imager_picker.dart';

class AuthProvider with ChangeNotifier {
  final AuthFireBaseServices _authservices = AuthFireBaseServices();
  final AuthImagePickerServices _imagerPicker = AuthImagePickerServices();
  File? _selectedImage;
  File? get selectedImage => _selectedImage;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isPasswordHidden = true;
  bool get isPasswordHidden => _isPasswordHidden;

  void visibilityTogle() {
    _isPasswordHidden = !_isPasswordHidden;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> profileImage() async {
    final image = await _imagerPicker.profileImagePicker();

    if (image == null) {
      return;
    } else {
      _selectedImage = image;
      notifyListeners();
    }
  }

  Future<void> userSingUp({
    required String name,
    required String email,
    required String password,
    required String role,
    required File profileImage,
  }) async {
    setLoading(true);

    try {
      await _authservices.userSinup(
        name: name,
        email: email,
        password: password,
        role: role,
        profileImage: profileImage,
      );
    } catch (e) {
      rethrow;
    } finally {
      setLoading(false);
    }
  }

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    setLoading(true);

    try {
      await _authservices.userLogin(email: email, password: password);
    } catch (e) {
      rethrow;
    } finally {
      setLoading(false);
    }
  }

  Future<String> userCheck() async {
    try {
      return await _authservices.userCheck();
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<void> userLogout() async {
    setLoading(true);
    try {
      await _authservices.userLogout();
    } catch (e) {
      rethrow;
    } finally {
      setLoading(false);
    }
  }
}

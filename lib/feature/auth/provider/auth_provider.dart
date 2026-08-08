import 'dart:io';

import 'package:flutter/material.dart';
import 'package:propertie_explore/feature/auth/services/auth_image_picker_services.dart';
import 'package:propertie_explore/feature/auth/services/auth_services.dart';

class AuthProvider with ChangeNotifier {
  final AuthFirebaseService _authService = AuthFirebaseService();
  final AuthImagePickerServices _imagePickerService = AuthImagePickerServices();
  File? _selectedImage;
  File? get selectedImage => _selectedImage;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isPasswordHidden = true;
  bool get isPasswordHidden => _isPasswordHidden;

  void visibilityToggle() {
    debugPrint(
      "[AuthProvider] visibilityToggle → isPasswordHidden: $_isPasswordHidden",
    );
    _isPasswordHidden = !_isPasswordHidden;
    notifyListeners();
  }

  void setLoading(bool value) {
    debugPrint("[AuthProvider] setLoading → $_isLoading");
    _isLoading = value;
    notifyListeners();
  }

  Future<void> pickProfileImage() async {
    debugPrint("[AuthProvider] pickProfileImage → started");
    final image = await _imagePickerService.profileImagePicker();

    if (image == null) {
      debugPrint("[AuthProvider] pickProfileImage → no image selected");
      return;
    } else {
      _selectedImage = image;

      debugPrint("[AuthProvider] pickProfileImage → image selected");
      notifyListeners();
    }
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String contact,
    required String password,
    required String role,
    required File profileImage,
  }) async {
    setLoading(true);

    try {
      debugPrint("[AuthProvider] signUp → started");
      await _authService.signUp(
        name: name,
        email: email,
        contact: contact,
        password: password,
        role: role,
        profileImage: profileImage,
      );
      debugPrint("[AuthProvider] signUp → completed");
    } catch (e) {
      debugPrint("[AuthProvider] signUp → failed: $e");
      rethrow;
    } finally {
      setLoading(false);
    }
  }

  Future<void> login({required String email, required String password}) async {
    setLoading(true);

    try {
      debugPrint("[AuthProvider] login → started");
      await _authService.login(email: email, password: password);

      debugPrint("[AuthProvider] login → completed");
    } catch (e) {
      debugPrint("[AuthProvider] login → failed: $e");
      rethrow;
    } finally {
      setLoading(false);
    }
  }

  Future<String> getUserRole() async {
    debugPrint("[AuthProvider] getUserRole → started");
    try {
      return await _authService.getUserRole();
    } on Exception catch (e) {
      debugPrint("[AuthProvider] getUserRole → failed: $e");
      rethrow;
    }
  }

  Future<void> logout() async {
    debugPrint("[AuthProvider] logout → started");
    setLoading(true);
    try {
      await _authService.logout();
      debugPrint("[AuthProvider] logout → completed");
    } catch (e) {
      debugPrint("[AuthProvider] logout → failed: $e");
      rethrow;
    } finally {
      setLoading(false);
    }
  }
}

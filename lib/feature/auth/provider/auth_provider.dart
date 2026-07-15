import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:propertie_explore/feature/auth/services/auth_services.dart';

class AuthProvider with ChangeNotifier {
  final AuthFireBaseServices _authservices = AuthFireBaseServices();
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

  Future<void> userSingUp({
    required String name,
    required String email,
    required String password,
    required String role,
  }) async {
    setLoading(true);

    try {
      await _authservices.userSinup(
        name: name,
        email: email,
        password: password,
        role: role,
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

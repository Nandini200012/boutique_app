import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isAdmin = false;

  bool get isAdmin => _isAdmin;

  void login(String username, String password) {
    if (username == 'admin' && password == 'admin@123') {
      _isAdmin = true;
    } else {
      _isAdmin = false;
    }
    notifyListeners();
  }
}

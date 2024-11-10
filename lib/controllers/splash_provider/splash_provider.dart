import 'package:flutter/material.dart';

class SplashProvider with ChangeNotifier {
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  SplashProvider() {
    _initialize();
  }

  Future<void> _initialize() async {
    // Simulate a delay for loading (e.g., API calls, initialization)
    await Future.delayed(const Duration(seconds: 3));
    _isInitialized = true;
    notifyListeners();
  }
}

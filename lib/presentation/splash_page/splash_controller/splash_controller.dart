import 'package:flutter/material.dart';

class SplashController extends ChangeNotifier {
  bool isInitialized = false;

  Future<void> initializeApp() async {
    await Future.delayed(Duration(milliseconds: 1500));
    isInitialized = true;
    notifyListeners();
  }
}

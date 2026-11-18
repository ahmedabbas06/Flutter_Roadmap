import 'package:flutter/material.dart';

class SettingsController extends ChangeNotifier {
  bool isResetting = false;

  void setResetting(bool val) {
    isResetting = val;
    notifyListeners();
  }
}

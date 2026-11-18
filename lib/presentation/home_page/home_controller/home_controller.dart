import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  bool isRefreshing = false;

  void setRefreshing(bool val) {
    isRefreshing = val;
    notifyListeners();
  }
}

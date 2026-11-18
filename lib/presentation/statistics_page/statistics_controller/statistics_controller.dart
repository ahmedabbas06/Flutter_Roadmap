import 'package:flutter/material.dart';

class StatisticsController extends ChangeNotifier {
  bool isRefreshing = false;

  void setRefreshing(bool val) {
    isRefreshing = val;
    notifyListeners();
  }
}

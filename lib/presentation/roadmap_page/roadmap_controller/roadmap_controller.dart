import 'package:flutter/material.dart';

class RoadmapController extends ChangeNotifier {
  int selectedPhase = 0; // 0: All, 1: Core, 2: Advanced, 3: Professional, 4: Production, 5: Extras

  void setPhase(int phase) {
    selectedPhase = phase;
    notifyListeners();
  }
}

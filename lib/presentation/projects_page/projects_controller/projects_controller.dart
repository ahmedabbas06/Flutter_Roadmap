import 'package:flutter/material.dart';

class ProjectsController extends ChangeNotifier {
  String selectedFilter = 'All'; // 'All', 'Completed', 'In Progress', 'Not Started'
  String searchQuery = '';

  void setFilter(String filter) {
    selectedFilter = filter;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    searchQuery = query;
    notifyListeners();
  }
}

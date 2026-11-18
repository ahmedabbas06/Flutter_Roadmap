import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';

class ThemeController extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  ThemeController() {
    loadThemePreference();
  }

  Future<void> loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String themeStr = prefs.getString(AppConstants.prefsKeyTheme) ?? AppConstants.themeLight;
    themeMode = themeStr == AppConstants.themeDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      AppConstants.prefsKeyTheme,
      themeMode == ThemeMode.dark ? AppConstants.themeDark : AppConstants.themeLight,
    );
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (themeMode == mode) return;
    themeMode = mode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      AppConstants.prefsKeyTheme,
      themeMode == ThemeMode.dark ? AppConstants.themeDark : AppConstants.themeLight,
    );
    notifyListeners();
  }

  bool get isDarkMode => themeMode == ThemeMode.dark;
}

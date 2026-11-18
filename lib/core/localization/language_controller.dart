import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';

class LanguageController extends ChangeNotifier {
  Locale currentLocale = Locale(AppConstants.languageEn);

  LanguageController() {
    loadLanguagePreference();
  }

  Future<void> loadLanguagePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString(AppConstants.prefsKeyLanguage) ?? AppConstants.languageEn;
    currentLocale = Locale(languageCode);
    notifyListeners();
  }

  Future<void> changeLanguage(String languageCode) async {
    if (currentLocale.languageCode == languageCode) return;
    currentLocale = Locale(languageCode);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.prefsKeyLanguage, languageCode);
    notifyListeners();
  }

  bool get isArabic => currentLocale.languageCode == AppConstants.languageAr;
}

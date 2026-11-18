import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static double spacingXS = 4.0;
  static double spacingS = 8.0;
  static double spacingM = 16.0;
  static double spacingL = 24.0;
  static double spacingXL = 32.0;

  static double radiusS = 8.0;
  static double radiusM = 12.0;
  static double radiusL = 16.0;
  static double radiusXL = 24.0;

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    primaryColor: AppColors.primaryLight,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryLight,
      secondary: AppColors.mutedOrange,
      surface: AppColors.surfaceLight,
      surfaceContainerHighest: AppColors.surfaceVariantLight,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.onSurfaceLight,
      onSurfaceVariant: AppColors.onSurfaceVariantLight,
      error: AppColors.error,
      outlineVariant: AppColors.dividerLight,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
      foregroundColor: AppColors.onSurfaceLight,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyles.headlineMedium.copyWith(color: AppColors.onSurfaceLight),
    ),
    cardTheme: CardThemeData(
      color: AppColors.surfaceLight,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(color: AppColors.dividerLight, width: 1.0),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.surfaceLight,
      selectedItemColor: AppColors.primaryLight,
      unselectedItemColor: AppColors.onSurfaceVariantLight,
      type: BottomNavigationBarType.fixed,
      elevation: 8.0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceLight,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: AppColors.dividerLight, width: 1.2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: AppColors.dividerLight, width: 1.2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: AppColors.primaryLight, width: 1.8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: AppColors.error, width: 1.2),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryLight,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        textStyle: AppTextStyles.labelLarge.copyWith(fontWeight: FontWeight.w600),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: AppColors.dividerLight,
      thickness: 1.0,
      space: 1.0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    primaryColor: AppColors.primaryDark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryDark,
      secondary: AppColors.mutedOrange,
      surface: AppColors.surfaceDark,
      surfaceContainerHighest: AppColors.surfaceVariantDark,
      onPrimary: AppColors.backgroundDark,
      onSecondary: Colors.white,
      onSurface: AppColors.onSurfaceDark,
      onSurfaceVariant: AppColors.onSurfaceVariantDark,
      error: AppColors.error,
      outlineVariant: AppColors.dividerDark,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      foregroundColor: AppColors.onSurfaceDark,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyles.headlineMedium.copyWith(color: AppColors.onSurfaceDark),
    ),
    cardTheme: CardThemeData(
      color: AppColors.surfaceDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(color: AppColors.dividerDark, width: 1.0),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.surfaceDark,
      selectedItemColor: AppColors.primaryDark,
      unselectedItemColor: AppColors.onSurfaceVariantDark,
      type: BottomNavigationBarType.fixed,
      elevation: 8.0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceVariantDark,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: AppColors.dividerDark, width: 1.2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: AppColors.dividerDark, width: 1.2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: AppColors.primaryDark, width: 1.8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: AppColors.error, width: 1.2),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryDark,
        foregroundColor: AppColors.backgroundDark,
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        textStyle: AppTextStyles.labelLarge.copyWith(fontWeight: FontWeight.w600),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: AppColors.dividerDark,
      thickness: 1.0,
      space: 1.0,
    ),
  );
}

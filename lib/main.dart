import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_roadmap/presentation/auth/auth_controller/auth_controller.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';
import 'core/localization/language_controller.dart';
import 'core/localization/app_localizations.dart';
import 'presentation/roadmap_data_controller.dart';
import 'presentation/auth/login_page/login_screen/login_screen.dart';
import 'presentation/main_navigation_screen.dart';
import 'presentation/splash_page/splash_screen/splash_screen.dart';
import 'presentation/splash_page/splash_controller/splash_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeController>(
          create: (context) => ThemeController(),
        ),
        ChangeNotifierProvider<LanguageController>(
          create: (context) => LanguageController(),
        ),
        ChangeNotifierProvider<AuthController>(
          create: (context) => AuthController(),
        ),
        ChangeNotifierProvider<RoadmapDataController>(
          create: (context) => RoadmapDataController(),
        ),
        ChangeNotifierProvider<SplashController>(
          create: (context) {
            SplashController ctrl = SplashController();
            ctrl.initializeApp();
            return ctrl;
          },
        ),
      ],
      child: Consumer3<ThemeController, LanguageController, SplashController>(
        builder: (context, themeController, langController, splashController, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Roadmap',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeController.themeMode,
            locale: langController.currentLocale,
            supportedLocales: [
              Locale('en', ''),
              Locale('ar', ''),
            ],
            localizationsDelegates: [
              AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: Consumer<AuthController>(
              builder: (context, authController, child) {
                if (!splashController.isInitialized) {
                  return SplashScreen();
                }
                if (authController.isAuthenticated) {
                  return MainNavigationScreen();
                }
                return LoginScreen();
              },
            ),
          );
        },
      ),
    );
  }
}

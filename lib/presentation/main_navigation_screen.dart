import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main_navigation_controller.dart';
import '../core/localization/app_localizations.dart';
import 'home_page/home_screen/home_screen.dart';
import 'roadmap_page/roadmap_screen/roadmap_screen.dart';
import 'projects_page/projects_screen/projects_screen.dart';
import 'statistics_page/statistics_screen/statistics_screen.dart';
import 'settings_page/settings_screen/settings_screen.dart';

class MainNavigationScreen extends StatelessWidget {
  MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations loc = AppLocalizations.of(context)!;

    List<Widget> pages = [
      HomeScreen(),
      RoadmapScreen(),
      ProjectsScreen(),
      StatisticsScreen(),
      SettingsScreen(),
    ];

    return ChangeNotifierProvider<MainNavigationController>(
      create: (context) => MainNavigationController(),
      child: Consumer<MainNavigationController>(
        builder: (context, controller, child) {
          return Scaffold(
            body: IndexedStack(
              index: controller.currentIndex,
              children: pages,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentIndex,
              onTap: (index) => controller.changeIndex(index),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard_outlined),
                  activeIcon: Icon(Icons.dashboard),
                  label: loc.translate('home'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.map_outlined),
                  activeIcon: Icon(Icons.map),
                  label: loc.translate('roadmap'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.folder_special_outlined),
                  activeIcon: Icon(Icons.folder_special),
                  label: loc.translate('projects'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart_outlined),
                  activeIcon: Icon(Icons.bar_chart),
                  label: loc.translate('statistics'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  activeIcon: Icon(Icons.settings),
                  label: loc.translate('settings'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

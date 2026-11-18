import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main_navigation_controller.dart';
import '../core/localization/app_localizations.dart';
import 'main_navigation_screen/widgets/custom_bottom_nav_bar_widget.dart';
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
      HomeScreen(key: PageStorageKey('HomeScreen')),
      RoadmapScreen(key: PageStorageKey('RoadmapScreen')),
      ProjectsScreen(key: PageStorageKey('ProjectsScreen')),
      StatisticsScreen(key: PageStorageKey('StatisticsScreen')),
      SettingsScreen(key: PageStorageKey('SettingsScreen')),
    ];

    List<CustomNavItemData> navItems = [
      CustomNavItemData(
        label: loc.translate('home'),
        icon: Icons.dashboard_outlined,
        activeIcon: Icons.dashboard,
      ),
      CustomNavItemData(
        label: loc.translate('roadmap'),
        icon: Icons.map_outlined,
        activeIcon: Icons.map,
      ),
      CustomNavItemData(
        label: loc.translate('projects'),
        icon: Icons.folder_special_outlined,
        activeIcon: Icons.folder_special,
      ),
      CustomNavItemData(
        label: loc.translate('statistics'),
        icon: Icons.bar_chart_outlined,
        activeIcon: Icons.bar_chart,
      ),
      CustomNavItemData(
        label: loc.translate('settings'),
        icon: Icons.settings_outlined,
        activeIcon: Icons.settings,
      ),
    ];

    return ChangeNotifierProvider<MainNavigationController>(
      create: (context) => MainNavigationController(),
      child: Consumer<MainNavigationController>(
        builder: (context, controller, child) {
          return Scaffold(
            body: AnimatedSwitcher(
              duration: Duration(milliseconds: 250),
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeIn,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: IndexedStack(
                key: ValueKey<int>(controller.currentIndex),
                index: controller.currentIndex,
                children: pages,
              ),
            ),
            bottomNavigationBar: CustomBottomNavBarWidget(
              currentIndex: controller.currentIndex,
              items: navItems,
              onTap: (index) => controller.changeIndex(index),
            ),
          );
        },
      ),
    );
  }
}

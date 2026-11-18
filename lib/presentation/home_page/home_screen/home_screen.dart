import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home_controller/home_controller.dart';
import '../../roadmap_data_controller.dart';
import '../../auth/auth_controller.dart';
import '../../../../core/localization/language_controller.dart';
import '../../../../core/common_widgets/loading_indicator_widget.dart';
import '../../../../core/common_widgets/section_header_widget.dart';
import '../../../../core/localization/app_localizations.dart';
import 'widgets/home_header_widget.dart';
import 'widgets/overall_progress_card_widget.dart';
import 'widgets/current_week_card_widget.dart';
import 'widgets/quick_stats_grid_widget.dart';
import 'widgets/recent_achievements_widget.dart';
import 'widgets/continue_learning_button_widget.dart';
import '../../weekly_details_page/weekly_details_screen/weekly_details_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageController langController = Provider.of<LanguageController>(context);
    AuthController authController = Provider.of<AuthController>(context);
    RoadmapDataController roadmapDataController = Provider.of<RoadmapDataController>(context);

    if (roadmapDataController.isLoading) {
      return Scaffold(
        body: LoadingIndicatorWidget(message: 'Loading your learning progress...'),
      );
    }

    return ChangeNotifierProvider<HomeController>(
      create: (context) => HomeController(),
      child: Consumer<HomeController>(
        builder: (context, controller, child) {
          AppLocalizations loc = AppLocalizations.of(context)!;
          bool isAr = langController.isArabic;
          var curWeek = roadmapDataController.currentWeekModel;

          return Scaffold(
            body: SafeArea(
              child: RefreshIndicator(
                onRefresh: () async {
                  await roadmapDataController.loadData();
                },
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeHeaderWidget(
                        roadmapDataController: roadmapDataController,
                        authController: authController,
                      ),
                      SizedBox(height: 20),
                      OverallProgressCardWidget(
                        roadmapDataController: roadmapDataController,
                      ),
                      SizedBox(height: 24),
                      if (curWeek != null) ...[
                        SectionHeaderWidget(
                          title: loc.translate('currentWeek'),
                        ),
                        SizedBox(height: 8),
                        CurrentWeekCardWidget(
                          week: curWeek,
                          isArabic: isAr,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WeeklyDetailsScreen(week: curWeek),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 16),
                        ContinueLearningButtonWidget(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WeeklyDetailsScreen(week: curWeek),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 24),
                      ],
                      QuickStatsGridWidget(
                        roadmapDataController: roadmapDataController,
                      ),
                      SizedBox(height: 24),
                      RecentAchievementsWidget(
                        achievements: roadmapDataController.achievements,
                        isArabic: isAr,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../statistics_controller/statistics_controller.dart';
import '../../roadmap_data_controller.dart';
import '../../../../core/localization/language_controller.dart';
import '../../../../core/common_widgets/loading_indicator_widget.dart';
import '../../../../core/localization/app_localizations.dart';
import 'widgets/overall_stats_header_widget.dart';
import 'widgets/phase_progress_list_widget.dart';
import 'widgets/tasks_breakdown_card_widget.dart';
import 'widgets/posts_progress_card_widget.dart';
import 'widgets/achievements_grid_widget.dart';

class StatisticsScreen extends StatelessWidget {
  StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageController langController = Provider.of<LanguageController>(context);
    RoadmapDataController roadmapDataController = Provider.of<RoadmapDataController>(context);

    if (roadmapDataController.isLoading) {
      return Scaffold(
        body: LoadingIndicatorWidget(message: 'Loading Statistics...'),
      );
    }

    return ChangeNotifierProvider<StatisticsController>(
      create: (context) => StatisticsController(),
      child: Consumer<StatisticsController>(
        builder: (context, controller, child) {
          AppLocalizations loc = AppLocalizations.of(context)!;
          bool isAr = langController.isArabic;

          return Scaffold(
            appBar: AppBar(
              title: Text(loc.translate('statistics')),
              elevation: 0,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OverallStatsHeaderWidget(
                      roadmapDataController: roadmapDataController,
                    ),
                    SizedBox(height: 16),
                    TasksBreakdownCardWidget(
                      roadmapDataController: roadmapDataController,
                    ),
                    SizedBox(height: 16),
                    PostsProgressCardWidget(
                      roadmapDataController: roadmapDataController,
                    ),
                    SizedBox(height: 16),
                    PhaseProgressListWidget(
                      roadmapDataController: roadmapDataController,
                    ),
                    SizedBox(height: 20),
                    AchievementsGridWidget(
                      achievements: roadmapDataController.achievements,
                      isArabic: isAr,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

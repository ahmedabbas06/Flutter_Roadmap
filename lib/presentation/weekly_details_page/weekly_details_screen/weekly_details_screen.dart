import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../weekly_details_controller/weekly_details_controller.dart';
import '../../roadmap_data_controller.dart';
import '../../../../core/localization/language_controller.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../data/models/week_model.dart';
import 'widgets/weekly_header_widget.dart';
import 'widgets/weekly_checklist_widget.dart';
import 'widgets/daily_schedule_widget.dart';
import 'widgets/weekly_projects_widget.dart';
import 'widgets/weekly_posts_widget.dart';
import 'widgets/weekly_review_widget.dart';
import 'widgets/weekly_test_widget.dart';

class WeeklyDetailsScreen extends StatelessWidget {
  final WeekModel week;

  WeeklyDetailsScreen({super.key, required this.week});

  @override
  Widget build(BuildContext context) {
    LanguageController langController = Provider.of<LanguageController>(context);
    RoadmapDataController roadmapDataController = Provider.of<RoadmapDataController>(context);

    // Get live updated week data
    WeekModel liveWeek = roadmapDataController.weeks.firstWhere(
      (w) => w.weekNumber == week.weekNumber,
      orElse: () => week,
    );

    return ChangeNotifierProvider<WeeklyDetailsController>(
      create: (context) {
        var ctrl = WeeklyDetailsController();
        ctrl.initControllers(liveWeek.reviewNotes);
        return ctrl;
      },
      child: Consumer<WeeklyDetailsController>(
        builder: (context, controller, child) {
          AppLocalizations loc = AppLocalizations.of(context)!;
          bool isAr = langController.isArabic;

          return Scaffold(
            appBar: AppBar(
              title: Text('${loc.translate("week")} ${liveWeek.weekNumber}'),
              elevation: 0,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WeeklyHeaderWidget(
                      week: liveWeek,
                      isArabic: isAr,
                    ),
                    SizedBox(height: 24),
                    WeeklyChecklistWidget(
                      week: liveWeek,
                      isArabic: isAr,
                      roadmapDataController: roadmapDataController,
                    ),
                    SizedBox(height: 24),
                    DailyScheduleWidget(
                      week: liveWeek,
                      isArabic: isAr,
                    ),
                    SizedBox(height: 24),
                    WeeklyProjectsWidget(
                      week: liveWeek,
                      isArabic: isAr,
                      roadmapDataController: roadmapDataController,
                      controller: controller,
                    ),
                    SizedBox(height: 24),
                    WeeklyPostsWidget(
                      week: liveWeek,
                      isArabic: isAr,
                      roadmapDataController: roadmapDataController,
                      controller: controller,
                    ),
                    SizedBox(height: 24),
                    WeeklyReviewWidget(
                      week: liveWeek,
                      isArabic: isAr,
                      roadmapDataController: roadmapDataController,
                      controller: controller,
                    ),
                    SizedBox(height: 24),
                    WeeklyTestWidget(
                      week: liveWeek,
                      roadmapDataController: roadmapDataController,
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

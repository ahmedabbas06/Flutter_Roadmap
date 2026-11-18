import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../roadmap_controller/roadmap_controller.dart';
import '../../roadmap_data_controller.dart';
import '../../../../core/localization/language_controller.dart';
import '../../../../core/common_widgets/loading_indicator_widget.dart';
import '../../../../core/localization/app_localizations.dart';
import 'widgets/phase_filter_tabs_widget.dart';
import 'widgets/roadmap_phase_header_widget.dart';
import 'widgets/week_card_widget.dart';
import 'widgets/later_topics_section_widget.dart';
import '../../weekly_details_page/weekly_details_screen/weekly_details_screen.dart';
import '../../../../data/models/week_model.dart';

class RoadmapScreen extends StatelessWidget {
  RoadmapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageController langController = Provider.of<LanguageController>(context);
    RoadmapDataController roadmapDataController = Provider.of<RoadmapDataController>(context);

    if (roadmapDataController.isLoading) {
      return Scaffold(
        body: LoadingIndicatorWidget(message: 'Loading Roadmap...'),
      );
    }

    return ChangeNotifierProvider<RoadmapController>(
      create: (context) => RoadmapController(),
      child: Consumer<RoadmapController>(
        builder: (context, controller, child) {
          AppLocalizations loc = AppLocalizations.of(context)!;
          bool isAr = langController.isArabic;
          List<WeekModel> weeks = roadmapDataController.weeks;

          List<WeekModel> filteredWeeks = weeks.where((w) {
            if (controller.selectedPhase == 0) return true;
            return w.phaseNumber == controller.selectedPhase;
          }).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text(loc.translate('roadmap')),
              elevation: 0,
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: PhaseFilterTabsWidget(
                      selectedPhase: controller.selectedPhase,
                      onPhaseSelected: (phase) {
                        controller.setPhase(phase);
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(16),
                      itemCount: filteredWeeks.length,
                      itemBuilder: (context, index) {
                        WeekModel week = filteredWeeks[index];
                        bool isFirstInPhase = index == 0 ||
                            filteredWeeks[index - 1].phaseNumber != week.phaseNumber;

                        double phaseProgress = roadmapDataController
                            .getPhaseProgressPercentage(week.phaseNumber);

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (isFirstInPhase) ...[
                              if (week.isLaterTopic && index > 0)
                                LaterTopicsSectionWidget(),
                              RoadmapPhaseHeaderWidget(
                                phaseNumber: week.phaseNumber,
                                title: isAr ? week.phaseNameAr : week.phaseNameEn,
                                progress: phaseProgress,
                              ),
                              SizedBox(height: 8),
                            ],
                            WeekCardWidget(
                              week: week,
                              isArabic: isAr,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        WeeklyDetailsScreen(week: week),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

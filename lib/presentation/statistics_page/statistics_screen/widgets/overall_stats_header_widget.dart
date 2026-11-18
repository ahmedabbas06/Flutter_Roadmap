import 'package:flutter/material.dart';
import '../../../../../core/common_widgets/progress_bar_widget.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../roadmap_data_controller.dart';

class OverallStatsHeaderWidget extends StatelessWidget {
  final RoadmapDataController roadmapDataController;

  OverallStatsHeaderWidget({
    super.key,
    required this.roadmapDataController,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations loc = AppLocalizations.of(context)!;
    double pct = roadmapDataController.overallProgressPercentage;
    int pctInt = (pct * 100).round();

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                loc.translate('overallProgress'),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              Text(
                '$pctInt%',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: theme.primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          ProgressBarWidget(progress: pct, height: 10),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    '${roadmapDataController.userProgress?.userXp ?? 0}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.amber[700],
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    loc.translate('xpPoints'),
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              Container(height: 30, width: 1, color: theme.dividerColor),
              Column(
                children: [
                  Text(
                    '${roadmapDataController.userProgress?.streakDays ?? 1}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.orange[700],
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    loc.translate('dayStreak'),
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

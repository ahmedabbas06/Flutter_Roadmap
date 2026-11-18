import 'package:flutter/material.dart';
import '../../../../../core/common_widgets/progress_bar_widget.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../roadmap_data_controller.dart';

class PostsProgressCardWidget extends StatelessWidget {
  final RoadmapDataController roadmapDataController;

  PostsProgressCardWidget({
    super.key,
    required this.roadmapDataController,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations loc = AppLocalizations.of(context)!;

    int published = roadmapDataController.totalPublishedPosts;
    int totalPosts = roadmapDataController.weeks.length * 3;
    double pct = totalPosts == 0 ? 0.0 : published / totalPosts;
    int pctInt = (pct * 100).round();

    return Container(
      padding: EdgeInsets.all(16),
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
                loc.translate('linkedInPosts'),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              Text(
                '$published / $totalPosts ($pctInt%)',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: theme.primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          ProgressBarWidget(progress: pct, height: 6),
        ],
      ),
    );
  }
}

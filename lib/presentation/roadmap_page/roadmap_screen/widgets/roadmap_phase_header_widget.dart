import 'package:flutter/material.dart';
import '../../../../../core/common_widgets/progress_bar_widget.dart';

class RoadmapPhaseHeaderWidget extends StatelessWidget {
  final int phaseNumber;
  final String title;
  final double progress;

  RoadmapPhaseHeaderWidget({
    super.key,
    required this.phaseNumber,
    required this.title,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    int pct = (progress * 100).round();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              Text(
                '$pct%',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: theme.primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          ProgressBarWidget(progress: progress, height: 6),
        ],
      ),
    );
  }
}

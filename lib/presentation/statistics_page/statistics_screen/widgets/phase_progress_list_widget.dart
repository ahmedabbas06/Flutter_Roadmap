import 'package:flutter/material.dart';
import '../../../../../core/common_widgets/progress_bar_widget.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../roadmap_data_controller.dart';

class PhaseProgressListWidget extends StatelessWidget {
  final RoadmapDataController roadmapDataController;

  PhaseProgressListWidget({
    super.key,
    required this.roadmapDataController,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations loc = AppLocalizations.of(context)!;

    List<Map<String, dynamic>> phases = [
      {'num': 1, 'name': loc.translate('phase1')},
      {'num': 2, 'name': loc.translate('phase2')},
      {'num': 3, 'name': loc.translate('phase3')},
      {'num': 4, 'name': loc.translate('phase4')},
      {'num': 5, 'name': loc.translate('phase5')},
    ];

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
          Text(
            loc.translate('currentPhase'),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 14),
          Column(
            children: phases.map((p) {
              int num = p['num'];
              String name = p['name'];
              double pct = roadmapDataController.getPhaseProgressPercentage(num);
              int pctInt = (pct * 100).round();

              return Container(
                margin: EdgeInsets.only(bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        Text(
                          '$pctInt%',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: theme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    ProgressBarWidget(progress: pct, height: 6),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

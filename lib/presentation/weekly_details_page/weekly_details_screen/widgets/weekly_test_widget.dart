import 'package:flutter/material.dart';
import '../../../../../core/common_widgets/custom_button_widget.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../data/models/week_model.dart';
import '../../../roadmap_data_controller.dart';

class WeeklyTestWidget extends StatelessWidget {
  final WeekModel week;
  final RoadmapDataController roadmapDataController;

  WeeklyTestWidget({
    super.key,
    required this.week,
    required this.roadmapDataController,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations loc = AppLocalizations.of(context)!;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            loc.translate('weeklyTest'),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 8),
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            value: week.isTestCompleted,
            activeColor: theme.primaryColor,
            title: Text(
              loc.translate('testConfirmation'),
              style: TextStyle(fontSize: 13),
            ),
            onChanged: (bool? val) {
              if (val != null) {
                roadmapDataController.toggleWeeklyTest(week.weekNumber, val);
              }
            },
          ),
          SizedBox(height: 16),
          CustomButtonWidget(
            text: week.isWeekCompleted
                ? loc.translate('statusCompleted')
                : loc.translate('markWeekCompleted'),
            backgroundColor: week.isWeekCompleted ? Colors.green : theme.primaryColor,
            icon: week.isWeekCompleted ? Icons.check_circle : Icons.emoji_events,
            onPressed: week.isWeekCompleted
                ? null
                : () async {
                    bool completed = await roadmapDataController
                        .markWeekAsCompleted(week.weekNumber);
                    if (!context.mounted) return;
                    if (completed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(loc.translate('weekCompletedMessage')),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.orange,
                          content: Text(loc.translate('cannotCompleteWeekMessage')),
                        ),
                      );
                    }
                  },
          ),
        ],
      ),
    );
  }
}

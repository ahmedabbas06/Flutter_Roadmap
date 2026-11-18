import 'package:flutter/material.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../data/models/week_model.dart';
import '../../../../../data/models/task_model.dart';
import '../../../roadmap_data_controller.dart';

class WeeklyChecklistWidget extends StatelessWidget {
  final WeekModel week;
  final bool isArabic;
  final RoadmapDataController roadmapDataController;

  WeeklyChecklistWidget({
    super.key,
    required this.week,
    required this.isArabic,
    required this.roadmapDataController,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations loc = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          loc.translate('weeklyChecklist'),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: theme.colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: week.tasks.length,
          itemBuilder: (context, index) {
            TaskModel task = week.tasks[index];
            String taskTitle = isArabic ? task.titleAr : task.titleEn;

            return Container(
              margin: EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: task.isCompleted
                      ? Colors.green.withValues(alpha: 0.3)
                      : theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
                ),
              ),
              child: CheckboxListTile(
                value: task.isCompleted,
                activeColor: theme.primaryColor,
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                title: Text(
                  taskTitle,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    decoration: task.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: task.isCompleted
                        ? theme.colorScheme.onSurfaceVariant
                        : theme.colorScheme.onSurface,
                  ),
                ),
                onChanged: (bool? val) {
                  if (val != null) {
                    roadmapDataController.toggleTask(task.id, val);
                  }
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

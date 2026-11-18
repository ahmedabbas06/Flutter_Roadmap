import 'package:flutter/material.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../data/models/week_model.dart';

class DailyScheduleWidget extends StatelessWidget {
  final WeekModel week;
  final bool isArabic;

  DailyScheduleWidget({
    super.key,
    required this.week,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations loc = AppLocalizations.of(context)!;

    List<Map<String, String>> scheduleItems = [
      {
        'day': loc.translate('satSun'),
        'desc': isArabic ? week.saturdaySundayAr : week.saturdaySundayEn,
        'icon': '1',
      },
      {
        'day': loc.translate('monTue'),
        'desc': isArabic ? week.mondayTuesdayAr : week.mondayTuesdayEn,
        'icon': '2',
      },
      {
        'day': loc.translate('wed'),
        'desc': isArabic ? week.wednesdayAr : week.wednesdayEn,
        'icon': '3',
      },
      {
        'day': loc.translate('thu'),
        'desc': isArabic ? week.thursdayOopAr : week.thursdayOopEn,
        'icon': '4',
      },
      {
        'day': loc.translate('fri'),
        'desc': isArabic ? week.fridayAr : week.fridayEn,
        'icon': '5',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          loc.translate('dailySchedule'),
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
          itemCount: scheduleItems.length,
          itemBuilder: (context, index) {
            var item = scheduleItems[index];

            return Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        item['icon']!,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: theme.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['day']!,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          item['desc']!,
                          style: TextStyle(
                            fontSize: 12,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

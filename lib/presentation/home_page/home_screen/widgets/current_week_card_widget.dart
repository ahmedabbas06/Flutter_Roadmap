import 'package:flutter/material.dart';
import '../../../../../core/common_widgets/status_badge_widget.dart';
import '../../../../../core/common_widgets/progress_bar_widget.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../data/models/week_model.dart';

class CurrentWeekCardWidget extends StatelessWidget {
  final WeekModel week;
  final bool isArabic;
  final VoidCallback onTap;

  CurrentWeekCardWidget({
    super.key,
    required this.week,
    required this.isArabic,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations loc = AppLocalizations.of(context)!;
    int pctInt = (week.completionPercentage * 100).round();
    String title = isArabic ? week.titleAr : week.titleEn;
    String phaseName = isArabic ? week.phaseNameAr : week.phaseNameEn;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: theme.primaryColor.withValues(alpha: 0.3),
            width: 1.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${loc.translate("week")} ${week.weekNumber}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                StatusBadgeWidget(status: week.calculatedStatus),
              ],
            ),
            SizedBox(height: 12),
            Text(
              phaseName,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: theme.primaryColor,
              ),
            ),
            SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.onSurface,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: ProgressBarWidget(
                    progress: week.completionPercentage,
                    height: 8,
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  '$pctInt%',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../data/models/achievement_model.dart';

class AchievementsGridWidget extends StatelessWidget {
  final List<AchievementModel> achievements;
  final bool isArabic;

  AchievementsGridWidget({
    super.key,
    required this.achievements,
    required this.isArabic,
  });

  IconData getIcon(String name) {
    switch (name) {
      case 'flag':
        return Icons.flag;
      case 'calendar_today':
        return Icons.calendar_today;
      case 'school':
        return Icons.school;
      case 'code':
        return Icons.code;
      case 'share':
        return Icons.share;
      case 'local_fire_department':
        return Icons.local_fire_department;
      case 'workspace_premium':
      default:
        return Icons.workspace_premium;
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations loc = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          loc.translate('recentAchievements'),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: theme.colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.3,
          ),
          itemCount: achievements.length,
          itemBuilder: (context, index) {
            AchievementModel ach = achievements[index];
            String title = isArabic ? ach.titleAr : ach.titleEn;
            String desc = isArabic ? ach.descriptionAr : ach.descriptionEn;
            Color iconColor = ach.isUnlocked ? Colors.amber : Colors.grey;

            return Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: ach.isUnlocked
                      ? Colors.amber.withValues(alpha: 0.6)
                      : theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
                  width: ach.isUnlocked ? 1.5 : 1,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(getIcon(ach.iconName), color: iconColor, size: 28),
                  SizedBox(height: 6),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: ach.isUnlocked
                          ? theme.colorScheme.onSurface
                          : theme.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2),
                  Text(
                    desc,
                    style: TextStyle(
                      fontSize: 10,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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

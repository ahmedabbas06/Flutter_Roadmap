import 'package:flutter/material.dart';
import '../../../../../core/common_widgets/status_badge_widget.dart';
import '../../../../../core/common_widgets/progress_bar_widget.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../data/models/project_model.dart';

class ProjectCardWidget extends StatelessWidget {
  final ProjectModel project;
  final bool isArabic;
  final VoidCallback onTap;

  ProjectCardWidget({
    super.key,
    required this.project,
    required this.isArabic,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations loc = AppLocalizations.of(context)!;
    String name = isArabic ? project.nameAr : project.nameEn;
    String desc = isArabic ? project.descriptionAr : project.descriptionEn;
    int pct = (project.progressPercentage * 100).round();

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: theme.primaryColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '${loc.translate("week")} ${project.weekNumber}',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: theme.primaryColor,
                    ),
                  ),
                ),
                StatusBadgeWidget(status: project.status),
              ],
            ),
            SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 4),
            Text(
              desc,
              style: TextStyle(
                fontSize: 13,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 12),
            if (project.repoUrl.isNotEmpty) ...[
              Row(
                children: [
                  Icon(Icons.link, size: 14, color: theme.primaryColor),
                  SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      project.repoUrl,
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.primaryColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
            Row(
              children: [
                Expanded(
                  child: ProgressBarWidget(
                    progress: project.progressPercentage,
                    height: 6,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '$pct%',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurfaceVariant,
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

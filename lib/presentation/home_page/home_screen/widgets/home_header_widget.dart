import 'package:flutter/material.dart';
import '../../../../../core/common_widgets/xp_badge_widget.dart';
import '../../../../../core/common_widgets/streak_badge_widget.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../auth/auth_controller/auth_controller.dart';
import '../../../roadmap_data_controller.dart';

class HomeHeaderWidget extends StatelessWidget {
  final RoadmapDataController roadmapDataController;
  final AuthController authController;

  HomeHeaderWidget({
    super.key,
    required this.roadmapDataController,
    required this.authController,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations loc = AppLocalizations.of(context)!;

    String userName = authController.currentUser?.displayName ?? 'Developer';
    if (userName.trim().isEmpty) userName = 'Developer';
    String greetingText = loc.translateWithParam('welcomeUser', 'name', userName);

    int xp = roadmapDataController.userProgress?.userXp ?? 0;
    int streakDays = roadmapDataController.userProgress?.streakDays ?? 1;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: theme.primaryColor.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.person,
                    color: theme.primaryColor,
                    size: 24,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      greetingText,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.onSurface,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2),
                    Text(
                      loc.translate('appSubtitle'),
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Divider(height: 1, color: theme.dividerColor.withValues(alpha: 0.5)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                loc.translate('overallProgress'),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  XpBadgeWidget(xp: xp),
                  StreakBadgeWidget(streakDays: streakDays),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

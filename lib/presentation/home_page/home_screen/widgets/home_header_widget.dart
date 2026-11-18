import 'package:flutter/material.dart';
import '../../../../../core/common_widgets/xp_badge_widget.dart';
import '../../../../../core/common_widgets/streak_badge_widget.dart';
import '../../../roadmap_data_controller.dart';
import '../../../auth/auth_controller.dart';

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
    String userName = authController.currentUser?.displayName ?? 'Developer';
    int xp = roadmapDataController.userProgress?.userXp ?? 0;
    int streakDays = roadmapDataController.userProgress?.streakDays ?? 1;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, $userName!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onSurface,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              Text(
                'Track your Flutter learning journey',
                style: TextStyle(
                  fontSize: 13,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 8),
        Row(
          children: [
            XpBadgeWidget(xp: xp),
            SizedBox(width: 6),
            StreakBadgeWidget(streakDays: streakDays),
          ],
        ),
      ],
    );
  }
}

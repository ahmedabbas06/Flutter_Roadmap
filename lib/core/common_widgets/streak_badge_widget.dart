import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class StreakBadgeWidget extends StatelessWidget {
  final int streakDays;

  StreakBadgeWidget({super.key, required this.streakDays});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.streakOrange.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.streakOrange, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.local_fire_department, size: 16, color: AppColors.streakOrange),
          SizedBox(width: 4),
          Text(
            '$streakDays Days',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.streakOrange,
            ),
          ),
        ],
      ),
    );
  }
}

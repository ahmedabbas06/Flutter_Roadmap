import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class XpBadgeWidget extends StatelessWidget {
  final int xp;

  XpBadgeWidget({super.key, required this.xp});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.xpGold.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.xpGold, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.stars, size: 16, color: AppColors.xpGold),
          SizedBox(width: 4),
          Text(
            '$xp XP',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.xpGold,
            ),
          ),
        ],
      ),
    );
  }
}

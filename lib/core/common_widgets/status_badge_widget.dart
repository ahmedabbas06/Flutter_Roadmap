import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../localization/app_localizations.dart';

class StatusBadgeWidget extends StatelessWidget {
  final String status;

  StatusBadgeWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    AppLocalizations loc = AppLocalizations.of(context)!;

    Color badgeColor;
    String displayStatus;

    switch (status) {
      case 'Completed':
      case 'Published':
        badgeColor = AppColors.success;
        displayStatus = status == 'Completed' ? loc.translate('statusCompleted') : loc.translate('statusPublished');
        break;
      case 'In Progress':
      case 'In Preparation':
        badgeColor = AppColors.warning;
        displayStatus = status == 'In Progress' ? loc.translate('statusInProgress') : loc.translate('statusInPreparation');
        break;
      case 'Ready':
        badgeColor = AppColors.sageGreen;
        displayStatus = loc.translate('statusReady');
        break;
      case 'Not Started':
      default:
        badgeColor = AppColors.coffeeBrown;
        displayStatus = loc.translate('statusNotStarted');
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: badgeColor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: badgeColor, width: 1.0),
      ),
      child: Text(
        displayStatus,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: badgeColor,
        ),
      ),
    );
  }
}

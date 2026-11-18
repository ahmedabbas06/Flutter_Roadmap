import 'package:flutter/material.dart';
import '../../../../../core/localization/app_localizations.dart';

class ForgotPasswordHeaderWidget extends StatelessWidget {
  ForgotPasswordHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations loc = AppLocalizations.of(context)!;

    return Column(
      children: [
        Container(
          width: 76,
          height: 76,
          decoration: BoxDecoration(
            color: theme.primaryColor.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(10),
          child: ClipOval(
            child: Image.asset(
              'assets/icon/app_icon.png',
              width: 56,
              height: 56,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.lock_reset_outlined,
                  size: 36,
                  color: theme.primaryColor,
                );
              },
            ),
          ),
        ),
        SizedBox(height: 16),
        Text(
          loc.translate('forgotPasswordTitle'),
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: theme.colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 8),
        Text(
          loc.translate('forgotPasswordSubtitle'),
          style: TextStyle(
            fontSize: 14,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

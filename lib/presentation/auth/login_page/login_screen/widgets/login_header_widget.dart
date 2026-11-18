import 'package:flutter/material.dart';
import '../../../../../core/localization/app_localizations.dart';

class LoginHeaderWidget extends StatelessWidget {
  LoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations loc = AppLocalizations.of(context)!;

    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: theme.primaryColor.withValues(alpha: 0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.flutter_dash,
            size: 48,
            color: theme.primaryColor,
          ),
        ),
        SizedBox(height: 20),
        Text(
          loc.translate('appName'),
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: theme.colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 6),
        Text(
          loc.translate('appSubtitle'),
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

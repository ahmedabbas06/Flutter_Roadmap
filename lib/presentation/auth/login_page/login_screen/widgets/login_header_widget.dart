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
          width: 84,
          height: 84,
          decoration: BoxDecoration(
            color: theme.primaryColor.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(10),
          child: ClipOval(
            child: Image.asset(
              'assets/icon/app_icon.png',
              width: 64,
              height: 64,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.flutter_dash,
                  size: 44,
                  color: theme.primaryColor,
                );
              },
            ),
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

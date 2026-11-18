import 'package:flutter/material.dart';
import '../../../../../core/localization/app_localizations.dart';

class LoginFooterWidget extends StatelessWidget {
  final VoidCallback onSignupTap;

  LoginFooterWidget({super.key, required this.onSignupTap});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations loc = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          loc.translate('dontHaveAccount'),
          style: TextStyle(
            color: theme.colorScheme.onSurfaceVariant,
            fontSize: 14,
          ),
        ),
        GestureDetector(
          onTap: onSignupTap,
          child: Text(
            loc.translate('signup'),
            style: TextStyle(
              color: theme.primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}

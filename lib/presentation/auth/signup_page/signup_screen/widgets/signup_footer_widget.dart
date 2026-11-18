import 'package:flutter/material.dart';
import '../../../../../core/localization/app_localizations.dart';

class SignupFooterWidget extends StatelessWidget {
  final VoidCallback onLoginTap;

  SignupFooterWidget({super.key, required this.onLoginTap});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations loc = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          loc.translate('alreadyHaveAccount'),
          style: TextStyle(
            color: theme.colorScheme.onSurfaceVariant,
            fontSize: 14,
          ),
        ),
        GestureDetector(
          onTap: onLoginTap,
          child: Text(
            loc.translate('login'),
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

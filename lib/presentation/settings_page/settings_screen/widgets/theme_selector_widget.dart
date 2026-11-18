import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_controller.dart';
import '../../../../../core/localization/app_localizations.dart';

class ThemeSelectorWidget extends StatelessWidget {
  final ThemeController themeController;

  ThemeSelectorWidget({super.key, required this.themeController});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations loc = AppLocalizations.of(context)!;
    ThemeMode curMode = themeController.themeMode;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.palette_outlined, color: theme.primaryColor, size: 22),
              SizedBox(width: 10),
              Text(
                loc.translate('theme'),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          RadioListTile<ThemeMode>(
            contentPadding: EdgeInsets.zero,
            dense: true,
            title: Text(loc.translate('lightMode')),
            value: ThemeMode.light,
            groupValue: curMode,
            activeColor: theme.primaryColor,
            onChanged: (val) {
              if (val != null) themeController.setThemeMode(val);
            },
          ),
          RadioListTile<ThemeMode>(
            contentPadding: EdgeInsets.zero,
            dense: true,
            title: Text(loc.translate('darkMode')),
            value: ThemeMode.dark,
            groupValue: curMode,
            activeColor: theme.primaryColor,
            onChanged: (val) {
              if (val != null) themeController.setThemeMode(val);
            },
          ),
        ],
      ),
    );
  }
}

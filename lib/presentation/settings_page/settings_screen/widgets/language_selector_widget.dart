import 'package:flutter/material.dart';
import '../../../../../core/localization/language_controller.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/constants/app_constants.dart';

class LanguageSelectorWidget extends StatelessWidget {
  final LanguageController langController;

  LanguageSelectorWidget({super.key, required this.langController});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations loc = AppLocalizations.of(context)!;
    String curLang = langController.currentLocale.languageCode;

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
              Icon(Icons.language, color: theme.primaryColor, size: 22),
              SizedBox(width: 10),
              Text(
                loc.translate('language'),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          RadioListTile<String>(
            contentPadding: EdgeInsets.zero,
            dense: true,
            title: Text(loc.translate('english')),
            value: AppConstants.languageEn,
            groupValue: curLang,
            activeColor: theme.primaryColor,
            onChanged: (val) {
              if (val != null) langController.changeLanguage(val);
            },
          ),
          RadioListTile<String>(
            contentPadding: EdgeInsets.zero,
            dense: true,
            title: Text(loc.translate('arabic')),
            value: AppConstants.languageAr,
            groupValue: curLang,
            activeColor: theme.primaryColor,
            onChanged: (val) {
              if (val != null) langController.changeLanguage(val);
            },
          ),
        ],
      ),
    );
  }
}

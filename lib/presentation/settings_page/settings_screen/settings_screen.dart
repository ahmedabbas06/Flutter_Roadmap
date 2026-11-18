import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../settings_controller/settings_controller.dart';
import '../../roadmap_data_controller.dart';
import '../../auth/auth_controller.dart';
import '../../../../core/localization/language_controller.dart';
import '../../../../core/theme/theme_controller.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/common_widgets/custom_button_widget.dart';
import 'widgets/profile_card_widget.dart';
import 'widgets/language_selector_widget.dart';
import 'widgets/theme_selector_widget.dart';
import 'widgets/reset_progress_dialog_widget.dart';
import 'widgets/app_info_widget.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageController langController = Provider.of<LanguageController>(context);
    ThemeController themeController = Provider.of<ThemeController>(context);
    AuthController authController = Provider.of<AuthController>(context);
    RoadmapDataController roadmapDataController = Provider.of<RoadmapDataController>(context);

    return ChangeNotifierProvider<SettingsController>(
      create: (context) => SettingsController(),
      child: Consumer<SettingsController>(
        builder: (context, controller, child) {
          AppLocalizations loc = AppLocalizations.of(context)!;

          return Scaffold(
            appBar: AppBar(
              title: Text(loc.translate('settings')),
              elevation: 0,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ProfileCardWidget(authController: authController),
                    SizedBox(height: 16),
                    LanguageSelectorWidget(langController: langController),
                    SizedBox(height: 16),
                    ThemeSelectorWidget(themeController: themeController),
                    SizedBox(height: 20),
                    CustomButtonWidget(
                      text: loc.translate('resetProgress'),
                      backgroundColor: Colors.red.shade700,
                      icon: Icons.restore,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => ResetProgressDialogWidget(
                            onConfirm: () async {
                              await roadmapDataController.resetAllUserProgress();
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Progress reset successfully')),
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    AppInfoWidget(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../auth/auth_controller/auth_controller.dart';

class ProfileCardWidget extends StatelessWidget {
  final AuthController authController;

  ProfileCardWidget({super.key, required this.authController});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations loc = AppLocalizations.of(context)!;
    String name = authController.currentUser?.displayName ?? 'Developer';
    String email = authController.currentUser?.email ?? 'No email';

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: theme.primaryColor.withValues(alpha: 0.2),
            child: Icon(Icons.person, color: theme.primaryColor, size: 30),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 13,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.red),
            tooltip: loc.translate('logout'),
            onPressed: () async {
              await authController.logout();
            },
          ),
        ],
      ),
    );
  }
}

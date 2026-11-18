import 'package:flutter/material.dart';
import '../../../../../core/common_widgets/custom_text_field_widget.dart';
import '../../../../../core/common_widgets/custom_button_widget.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../forgot_password_controller/forgot_password_controller.dart';
import '../../../auth_controller.dart';

class ForgotPasswordFormWidget extends StatelessWidget {
  final ForgotPasswordController controller;
  final AuthController authController;

  ForgotPasswordFormWidget({
    super.key,
    required this.controller,
    required this.authController,
  });

  @override
  Widget build(BuildContext context) {
    AppLocalizations loc = AppLocalizations.of(context)!;

    if (controller.isEmailSent) {
      return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.green.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(Icons.check_circle_outline, color: Colors.green, size: 48),
            SizedBox(height: 12),
            Text(
              loc.translate('sendResetLink'),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 12),
            CustomButtonWidget(
              text: loc.translate('login'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }

    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextFieldWidget(
            controller: controller.emailController,
            label: loc.translate('email'),
            hint: 'user@example.com',
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return loc.translate('requiredField');
              }
              if (!value.contains('@')) {
                return loc.translate('invalidEmail');
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          if (authController.errorMessage != null) ...[
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                authController.errorMessage!,
                style: TextStyle(color: Colors.red, fontSize: 13),
              ),
            ),
            SizedBox(height: 16),
          ],
          CustomButtonWidget(
            text: loc.translate('sendResetLink'),
            isLoading: authController.isLoading,
            onPressed: () async {
              if (controller.formKey.currentState!.validate()) {
                bool success = await authController.sendPasswordReset(
                  controller.emailController.text.trim(),
                );
                if (success) {
                  controller.setEmailSent(true);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}

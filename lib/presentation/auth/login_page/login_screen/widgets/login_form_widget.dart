import 'package:flutter/material.dart';
import '../../../../../core/common_widgets/custom_text_field_widget.dart';
import '../../../../../core/common_widgets/custom_button_widget.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../login_controller/login_controller.dart';
import '../../../auth_controller.dart';

class LoginFormWidget extends StatelessWidget {
  final LoginController controller;
  final AuthController authController;
  final VoidCallback onForgotPassword;
  final VoidCallback onSuccess;

  LoginFormWidget({
    super.key,
    required this.controller,
    required this.authController,
    required this.onForgotPassword,
    required this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    AppLocalizations loc = AppLocalizations.of(context)!;

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
          SizedBox(height: 16),
          CustomTextFieldWidget(
            controller: controller.passwordController,
            label: loc.translate('password'),
            hint: '••••••••',
            prefixIcon: Icons.lock_outline,
            obscureText: controller.obscurePassword,
            suffixIcon: IconButton(
              icon: Icon(
                controller.obscurePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
              onPressed: controller.togglePasswordVisibility,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return loc.translate('requiredField');
              }
              if (value.length < 6) {
                return loc.translate('passwordTooShort');
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: onForgotPassword,
              child: Text(
                loc.translate('forgotPassword'),
                style: TextStyle(fontSize: 13),
              ),
            ),
          ),
          SizedBox(height: 16),
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
            text: loc.translate('login'),
            isLoading: authController.isLoading,
            onPressed: () async {
              if (controller.formKey.currentState!.validate()) {
                bool success = await authController.login(
                  controller.emailController.text.trim(),
                  controller.passwordController.text.trim(),
                );
                if (success) {
                  onSuccess();
                }
              }
            },
          ),
        ],
      ),
    );
  }
}

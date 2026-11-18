import 'package:flutter/material.dart';
import '../../../../../core/common_widgets/custom_text_field_widget.dart';
import '../../../../../core/common_widgets/custom_button_widget.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../signup_controller/signup_controller.dart';
import '../../../auth_controller.dart';

class SignupFormWidget extends StatelessWidget {
  final SignupController controller;
  final AuthController authController;
  final VoidCallback onSuccess;

  SignupFormWidget({
    super.key,
    required this.controller,
    required this.authController,
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
            controller: controller.fullNameController,
            label: loc.translate('fullName'),
            hint: 'John Doe',
            prefixIcon: Icons.person_outline,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return loc.translate('requiredField');
              }
              return null;
            },
          ),
          SizedBox(height: 14),
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
          SizedBox(height: 14),
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
          SizedBox(height: 14),
          CustomTextFieldWidget(
            controller: controller.confirmPasswordController,
            label: loc.translate('confirmPassword'),
            hint: '••••••••',
            prefixIcon: Icons.lock_clock_outlined,
            obscureText: controller.obscureConfirmPassword,
            suffixIcon: IconButton(
              icon: Icon(
                controller.obscureConfirmPassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
              onPressed: controller.toggleConfirmPasswordVisibility,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return loc.translate('requiredField');
              }
              if (value != controller.passwordController.text) {
                return loc.translate('passwordsDoNotMatch');
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
            text: loc.translate('signup'),
            isLoading: authController.isLoading,
            onPressed: () async {
              if (controller.formKey.currentState!.validate()) {
                bool success = await authController.signUp(
                  controller.emailController.text.trim(),
                  controller.passwordController.text.trim(),
                  controller.fullNameController.text.trim(),
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

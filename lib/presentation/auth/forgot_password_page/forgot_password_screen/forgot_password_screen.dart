import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../forgot_password_controller/forgot_password_controller.dart';
import '../../auth_controller.dart';
import 'widgets/forgot_password_header_widget.dart';
import 'widgets/forgot_password_form_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ForgotPasswordController>(
      create: (context) => ForgotPasswordController(),
      child: Consumer2<ForgotPasswordController, AuthController>(
        builder: (context, controller, authController, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ForgotPasswordHeaderWidget(),
                      SizedBox(height: 28),
                      ForgotPasswordFormWidget(
                        controller: controller,
                        authController: authController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

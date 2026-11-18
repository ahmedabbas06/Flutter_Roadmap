import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../auth_controller/auth_controller.dart';
import '../login_controller/login_controller.dart';
import 'widgets/login_header_widget.dart';
import 'widgets/login_form_widget.dart';
import 'widgets/login_footer_widget.dart';
import '../../signup_page/signup_screen/signup_screen.dart';
import '../../forgot_password_page/forgot_password_screen/forgot_password_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginController>(
      create: (context) => LoginController(),
      child: Consumer2<LoginController, AuthController>(
        builder: (context, controller, authController, child) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginHeaderWidget(),
                      SizedBox(height: 32),
                      LoginFormWidget(
                        controller: controller,
                        authController: authController,
                        onForgotPassword: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen(),
                            ),
                          );
                        },
                        onSuccess: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                      ),
                      SizedBox(height: 24),
                      LoginFooterWidget(
                        onSignupTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ),
                          );
                        },
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

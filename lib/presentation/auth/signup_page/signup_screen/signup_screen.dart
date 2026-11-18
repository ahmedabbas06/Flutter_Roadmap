import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../auth_controller/auth_controller.dart';
import '../signup_controller/signup_controller.dart';
import 'widgets/signup_header_widget.dart';
import 'widgets/signup_form_widget.dart';
import 'widgets/signup_footer_widget.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignupController>(
      create: (context) => SignupController(),
      child: Consumer2<SignupController, AuthController>(
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
                      SignupHeaderWidget(),
                      SizedBox(height: 24),
                      SignupFormWidget(
                        controller: controller,
                        authController: authController,
                        onSuccess: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                      ),
                      SizedBox(height: 20),
                      SignupFooterWidget(
                        onLoginTap: () {
                          Navigator.pop(context);
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

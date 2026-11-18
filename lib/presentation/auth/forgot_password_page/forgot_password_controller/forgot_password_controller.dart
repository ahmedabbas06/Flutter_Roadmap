import 'package:flutter/material.dart';

class ForgotPasswordController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isEmailSent = false;

  void setEmailSent(bool sent) {
    isEmailSent = sent;
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}

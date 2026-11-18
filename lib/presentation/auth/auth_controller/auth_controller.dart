import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../data/repositories/auth_repository.dart';

class AuthController extends ChangeNotifier {
  AuthRepository authRepository = AuthRepository();
  User? currentUser;
  bool isLoading = false;
  String? errorMessage;

  AuthController() {
    currentUser = authRepository.currentUser;
    authRepository.authStateChanges.listen((User? user) {
      currentUser = user;
      notifyListeners();
    });
  }

  bool get isAuthenticated => currentUser != null;

  Future<bool> login(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      UserCredential cred = await authRepository.login(email: email, password: password);
      currentUser = cred.user;
      isLoading = false;
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      errorMessage = e.message ?? 'Authentication failed';
      notifyListeners();
      return false;
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> signUp(String email, String password, String fullName) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      UserCredential cred = await authRepository.signUp(
        email: email,
        password: password,
        fullName: fullName,
      );
      currentUser = cred.user;
      isLoading = false;
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      errorMessage = e.message ?? 'Sign up failed';
      notifyListeners();
      return false;
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> sendPasswordReset(String email) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await authRepository.sendPasswordResetEmail(email);
      isLoading = false;
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      errorMessage = e.message ?? 'Password reset failed';
      notifyListeners();
      return false;
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    await authRepository.logout();
    currentUser = null;
    notifyListeners();
  }
}

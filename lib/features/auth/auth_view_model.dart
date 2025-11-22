import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mongiz/core/data/auth_api_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthApiService _apiService = AuthApiService();
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // ------------------------------------
  // Check Auth Status (Startup)
  // ------------------------------------
  Future<bool> checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('user_uid');
    
    // Verify if Firebase also thinks we are logged in
    final currentUser = _apiService.getCurrentUser();
    
    if (uid != null && currentUser != null) {
      return true;
    } else {
      // If inconsistency, clear prefs
      await prefs.remove('user_uid');
      return false;
    }
  }

  // ------------------------------------
  // Save Session
  // ------------------------------------
  Future<void> _saveSession(String uid) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_uid', uid);
    debugPrint('User Session Saved: $uid');
  }

  // ------------------------------------
  // Sign In
  // ------------------------------------
  Future<bool> signIn(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final user = await _apiService.loginUser(
        email: email.trim(),
        password: password.trim(),
      );

      if (user != null) {
        await _saveSession(user.uid);
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = 'فشل تسجيل الدخول: لم يتم إرجاع مستخدم.';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = e.toString().contains('Exception:')
          ? e.toString().replaceFirst('Exception: ', '')
          : 'حدث خطأ غير متوقع.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // ------------------------------------
  // Sign Up
  // ------------------------------------
  Future<bool> signUp(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final user = await _apiService.registerUser(
        email: email.trim(),
        password: password.trim(),
      );

      if (user != null) {
        await _saveSession(user.uid);
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = 'فشل التسجيل: لم يتم إرجاع مستخدم.';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = e.toString().contains('Exception:')
          ? e.toString().replaceFirst('Exception: ', '')
          : 'حدث خطأ غير متوقع.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // ------------------------------------
  // Sign Out
  // ------------------------------------
  Future<void> signOut() async {
    await _apiService.signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_uid');
    notifyListeners();
  }
}

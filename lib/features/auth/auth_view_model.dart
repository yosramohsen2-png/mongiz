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
    final accessToken = prefs.getString('access_token');
    final refreshToken = prefs.getString('refresh_token');
    // Simple check: if tokens exist, we assume logged in.
    // You could also validate the token expiry here if needed.
    return accessToken != null && refreshToken != null;
  }

  // ------------------------------------
  // Save Tokens
  // ------------------------------------
  Future<void> _saveTokens(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();

    if (data.containsKey('accessToken')) {
      await prefs.setString('access_token', data['accessToken']);
    }
    if (data.containsKey('refreshToken')) {
      await prefs.setString('refresh_token', data['refreshToken']);
    }
    debugPrint('Tokens saved successfully!');
  }

  // ------------------------------------
  // Sign In
  // ------------------------------------
  Future<bool> signIn(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final responseData = await _apiService.loginUser(
        email: email.trim(),
        password: password.trim(),
      );

      await _saveTokens(responseData);

      _isLoading = false;
      notifyListeners();
      return true; 
    } catch (e) {
      _errorMessage = e.toString().contains('Exception:')
          ? e.toString().replaceFirst('Exception: ', '')
          : 'حدث خطأ غير متوقع: تأكدي من تشغيل السيرفر والاتصال بالإنترنت.';
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
      final responseData = await _apiService.registerUser(
        email: email.trim(),
        password: password.trim(),
      );

      await _saveTokens(responseData);

      _isLoading = false;
      notifyListeners();
      return true; 
    } catch (e) {
      _errorMessage = e.toString().contains('Exception:')
          ? e.toString().replaceFirst('Exception: ', '')
          : 'حدث خطأ غير متوقع: تأكدي من تشغيل السيرفر والاتصال بالإنترنت.';
      _isLoading = false;
      notifyListeners();
      return false; 
    }
  }

  // ------------------------------------
  // Sign Out
  // ------------------------------------
  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');
    notifyListeners();
  }
}

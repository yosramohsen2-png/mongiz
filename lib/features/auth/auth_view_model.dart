import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/data/auth_api_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthApiService _apiService = AuthApiService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> signUp(String email, String password) async {
    _setLoading(true);
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiService.registerUser(email: email, password: password);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        await _saveTokens(data);
        _setLoading(false);
        return true;
      } else {
        _errorMessage = 'Sign Up Failed: ${response.body}';
        _setLoading(false);
        return false;
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
      _setLoading(false);
      return false;
    }
  }

  Future<bool> signIn(String email, String password) async {
    _setLoading(true);
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiService.loginUser(email: email, password: password);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        await _saveTokens(data);
        _setLoading(false);
        return true;
      } else {
        _errorMessage = 'Sign In Failed: ${response.body}';
        _setLoading(false);
        return false;
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
      _setLoading(false);
      return false;
    }
  }

  Future<void> _saveTokens(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    if (data.containsKey('accessToken')) {
      await prefs.setString('accessToken', data['accessToken']);
    }
    if (data.containsKey('refreshToken')) {
      await prefs.setString('refreshToken', data['refreshToken']);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}

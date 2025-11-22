// import 'dart:convert';
import 'dart:convert';

import 'package:http/http.dart' as http;

// تم التأكيد على استخدام IP المحاكي والـ Port 3000
const String baseUrl = 'http://10.0.2.2:3000/api/auth';

class AuthApiService {
  // ------------------------------------
  // دالة التسجيل (Sign Up)
  // ------------------------------------
  Future<Map<String, dynamic>> registerUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    // API Service مسؤول عن فحص الحالة وإخراج بيانات نظيفة
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      // إخراج رسالة الخطأ لتظهر للمستخدم بوضوح
      final errorData = jsonDecode(response.body);
      throw Exception(
        errorData['message'] ??
            'فشل التسجيل. رمز الحالة: ${response.statusCode}',
      );
    }
  }

  // ------------------------------------
  // دالة تسجيل الدخول (Sign In)
  // ------------------------------------
  Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    // API Service مسؤول عن فحص الحالة وإخراج بيانات نظيفة
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      final errorData = jsonDecode(response.body);
      throw Exception(
        errorData['message'] ??
            'فشل تسجيل الدخول. رمز الحالة: ${response.statusCode}',
      );
    }
  }
}

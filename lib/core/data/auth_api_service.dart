import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthApiService {
  // TODO: Replace with your actual server IP
  static const String _baseUrl = 'http://your-server-ip:5000/api/auth';

  Future<http.Response> registerUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$_baseUrl/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    return response;
  }

  Future<http.Response> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$_baseUrl/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    return response;
  }
}

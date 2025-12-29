import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = "http://10.192.124.105:8000";

  static Future<bool> registerUser({
    required String name,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      final url = Uri.parse("$baseUrl/auth/register");

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
          "role": role,
        }),
      );

      // 👇 THESE 2 LINES ARE VERY IMPORTANT
      print("REGISTER STATUS CODE: ${response.statusCode}");
      print("REGISTER RESPONSE BODY: ${response.body}");

      return response.statusCode == 200;
    } catch (e) {
      print("REGISTER ERROR: $e");
      return false;
    }
  }

  static Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final url = Uri.parse("$baseUrl/auth/login");

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      print("LOGIN STATUS CODE: ${response.statusCode}");
      print("LOGIN RESPONSE BODY: ${response.body}");

      return response.statusCode == 200;
    } catch (e) {
      print("LOGIN ERROR: $e");
      return false;
    }
  }
}

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class AuthService {
  // static const String baseUrl = "http://172.22.39.105:8000";
  static const String baseUrl = "http://10.137.141.105:8000";
  // ================= REGISTER =================
  static Future<Map<String, dynamic>> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http
          .post(
            Uri.parse("$baseUrl/auth/register"),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              "name": name,
              "email": email,
              "password": password,
            }),
          )
          .timeout(const Duration(seconds: 10));

      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return {
          "success": true,
          "message": body["message"] ?? "Registered successfully",
        };
      } else {
        return {
          "success": false,
          "message": body["detail"] ?? "Registration failed",
        };
      }
    } catch (e) {
      return {"success": false, "message": "Unable to connect to server"};
    }
  }

  // ================= LOGIN =================
  static Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http
          .post(
            Uri.parse("$baseUrl/auth/login"),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({"email": email, "password": password}),
          )
          .timeout(const Duration(seconds: 10));

      final decoded = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // ✅ Normalize response for Flutter UI
        return {
          "success": true,
          "data": {
            "id": decoded["id"],
            "name": decoded["name"],
            "email": decoded["email"],
            "role": decoded["role"],
          },
        };
      }

      return {
        "success": false,
        "message": decoded["detail"] ?? "Login failed",
        "status": response.statusCode,
      };
    } on TimeoutException {
      return {"success": false, "message": "Server timeout"};
    } catch (e) {
      return {"success": false, "message": "Unable to connect to server"};
    }
  }
}

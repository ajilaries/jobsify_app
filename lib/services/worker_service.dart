import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/worker_model.dart';
import '../utils/api_endpoints.dart';
import '../services/user_session.dart';

class WorkerService {
  // ===============================
  // 🔹 FETCH VERIFIED & AVAILABLE WORKERS
  // ===============================
  static Future<List<Worker>> fetchWorkers() async {
    final uri = Uri.parse("${ApiEndpoints.baseUrl}/workers");

    final res = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        // ❗ token optional here (public endpoint)
      },
    );

    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body);
      return data.map((e) => Worker.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load workers (${res.statusCode})");
    }
  }

  // ===============================
  // 🔹 CREATE WORKER (JWT REQUIRED)
  // ===============================
  static Future<bool> createWorker({
    required String name,
    required String role,
    required String phone,
    required int experience,
    required String location,
    String? latitude,
    String? longitude,
  }) async {
    final token = UserSession.token;

    if (token == null) {
      throw Exception("User not logged in");
    }

    final res = await http.post(
      Uri.parse("${ApiEndpoints.baseUrl}/workers"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token", // 🔐 REQUIRED
      },
      body: jsonEncode({
        "name": name,
        "role": role,
        "phone": phone,
        "experience": experience,
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
      }),
    );

    return res.statusCode == 201;
  }

  // ===============================
  // 🔹 REPORT WORKER (JWT REQUIRED)
  // ===============================
  static Future<void> reportWorker({
    required int workerId,
    required String reason,
    String? description,
  }) async {
    final token = UserSession.token;

    if (token == null) {
      throw Exception("User not logged in");
    }

    final res = await http.post(
      Uri.parse(ApiEndpoints.reports),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token", // 🔐 REQUIRED
      },
      body: jsonEncode({
        "worker_id": workerId,
        "reason": reason,
        "description": description,
      }),
    );

    if (res.statusCode != 201) {
      throw Exception("Failed to submit report (${res.statusCode})");
    }
  }
}

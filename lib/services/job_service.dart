import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/job_model.dart';
import '../utils/api_endpoints.dart';
import '../services/user_session.dart';

class JobService {
  // ===============================
  // 🔹 GET ALL JOBS (PUBLIC)
  // ===============================
  static Future<List<Job>> fetchJobs() async {
    final uri = Uri.parse('${ApiEndpoints.baseUrl}/jobs');

    try {
      final response = await http
          .get(uri, headers: {"Content-Type": "application/json"})
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        if (response.body.isEmpty || response.body == '[]') {
          return [];
        }

        final List<dynamic> data = jsonDecode(response.body);
        return data
            .map((e) => Job.fromJson(e as Map<String, dynamic>))
            .toList();
      }

      throw Exception("Failed to load jobs (${response.statusCode})");
    } on TimeoutException {
      throw Exception("Server timeout");
    } catch (e) {
      debugPrint("FETCH JOBS ERROR: $e");
      throw Exception("Fetch jobs failed");
    }
  }

  // ===============================
  // 🔹 CREATE JOB (JWT REQUIRED)
  // ===============================
  static Future<void> createJob({
    required String title,
    required String category,
    required String description,
    required String location,
    required String phone,
    String? latitude,
    String? longitude,
    bool urgent = false,
    String? salary,
  }) async {
    final token = UserSession.token;

    if (token == null) {
      throw Exception("User not logged in");
    }

    final uri = Uri.parse('${ApiEndpoints.baseUrl}/jobs');

    final body = {
      "title": title,
      "category": category,
      "description": description,
      "location": location,
      "phone": phone,
      "latitude": latitude,
      "longitude": longitude,
      "urgent": urgent,
      "salary": salary,
    };

    try {
      final response = await http
          .post(
            uri,
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token", // 🔐 REQUIRED
            },
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception(
          "Job creation failed (${response.statusCode}): ${response.body}",
        );
      }
    } on TimeoutException {
      throw Exception("Server timeout");
    } catch (e) {
      debugPrint("CREATE JOB ERROR: $e");
      throw Exception("Create job failed");
    }
  }
}

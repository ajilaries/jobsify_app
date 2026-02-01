import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/worker_model.dart';

class WorkerService {
  static const baseUrl = "http://172.22.39.105:8000/workers/";

  static Future<List<Worker>> fetchWorkers() async {
    final res = await http.get(Uri.parse(baseUrl));
    final List data = jsonDecode(res.body);
    return data.map((e) => Worker.fromJson(e)).toList();
  }

  static Future<bool> createWorker({
    required String name,
    required String role,
    required String phone,
    required int experience,
    required String location,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "role": role,
        "phone": phone,
        "experience": experience,
        "location": location,
      }),
    );

    return response.statusCode == 201 || response.statusCode == 200;
  }
}

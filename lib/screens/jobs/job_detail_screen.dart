import 'package:flutter/material.dart';

class JobDetailScreen extends StatelessWidget {
  final Map<String, String> job;

  const JobDetailScreen({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(title: const Text("Job Details")),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Job title
            Text(
              job["title"]!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 10),

            // Category + location
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    job["category"]!,
                    style: const TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                ),

                const SizedBox(width: 10),

                const Icon(Icons.location_on, size: 16, color: Colors.grey),

                const SizedBox(width: 4),

                Text(
                  job["location"]!,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Description title
            const Text(
              "Job Description",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 8),

            // Description content
            Text(
              job["description"]!,
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
          ],
        ),
      ),

      // Bottom action button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              // later: contact / apply logic
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Contact Provider",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  Widget _statCard({
    required String title,
    required String value,
    required IconData icon,
    Color color = Colors.black,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: color.withValues(alpha: 0.1),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Overview",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          _statCard(
            title: "Total Users",
            value: "128",
            icon: Icons.people,
            color: Colors.blue,
          ),

          _statCard(
            title: "Job Providers",
            value: "34",
            icon: Icons.badge,
            color: Colors.green,
          ),

          _statCard(
            title: "Pending Jobs",
            value: "7",
            icon: Icons.pending_actions,
            color: Colors.orange,
          ),

          _statCard(
            title: "Reports",
            value: "2",
            icon: Icons.report,
            color: Colors.red,
          ),

          const SizedBox(height: 20),

          const Text(
            "Quick Actions",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          Card(
            child: ListTile(
              leading: const Icon(Icons.verified),
              title: const Text("Verify Pending Jobs"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // later: navigate to Job Verification screen
              },
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.badge),
              title: const Text("Verify Job Providers"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // later: navigate to Provider Verification screen
              },
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.report),
              title: const Text("View Reports"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // later: navigate to Reports screen
              },
            ),
          ),
        ],
      ),
    );
  }
}

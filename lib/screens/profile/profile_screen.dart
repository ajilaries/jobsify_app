import 'package:flutter/material.dart';
import '../jobs/post_job_screen.dart';
import '../../services/user_session.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String email = UserSession.email ?? "Unknown";
    final String role = UserSession.role ?? "user";

    // Example logic: job provider vs seeker
    final bool isProvider = role == "provider" || role == "user";

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(title: const Text("Profile"), centerTitle: true),
      body: Column(
        children: [
          // 🔹 USER HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  email.split('@').first, // simple name from email
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(email, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 6),
                Text(
                  role == "admin" ? "Role: Admin" : "Role: User",
                  style: TextStyle(
                    color: role == "admin" ? Colors.red : Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // 🔹 ACTION LIST
          Expanded(
            child: ListView(
              children: [
                _ProfileTile(
                  icon: Icons.work_outline,
                  title: "My Jobs",
                  onTap: () {
                    // TODO: navigate to my jobs screen
                  },
                ),

                if (isProvider)
                  _ProfileTile(
                    icon: Icons.add_circle_outline,
                    title: "Post a Job",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PostJobScreen(),
                        ),
                      );
                    },
                  ),

                _ProfileTile(
                  icon: Icons.logout,
                  title: "Logout",
                  onTap: () {
                    // 🔐 CLEAR SESSION
                    UserSession.clear();

                    // 🔁 GO TO LOGIN (CLEAR STACK)
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/login',
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ProfileTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

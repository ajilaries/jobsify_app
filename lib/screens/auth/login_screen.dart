import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            // App Title
            const Text(
              "Jobsify",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 40),

            // Email Input Box
            TextField(
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Password Input Box
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Login Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Login"),
            ),

            const SizedBox(height: 20),

            // Go to Register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text("Register"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

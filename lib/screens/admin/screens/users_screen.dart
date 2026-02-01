import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 6, // dummy users
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text("User ${index + 1}"),
              subtitle: const Text("Active user"),
              trailing: IconButton(
                icon: const Icon(Icons.block, color: Colors.red),
                onPressed: () {
                  // later: block user API
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

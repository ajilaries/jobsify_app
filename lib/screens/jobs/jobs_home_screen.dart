import 'package:flutter/material.dart';

class JobsHomeScreen extends StatelessWidget {
  const JobsHomeScreen({super.key});

  static const Color primaryColor = Color(0xFF1B0C6D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔍 Search
              _searchBar(),

              const SizedBox(height: 16),

              // 📌 Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Available Jobs",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.filter_list, size: 18),
                      SizedBox(width: 4),
                      Text("Filter"),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // 📄 Job list
              Expanded(
                child: ListView(
                  children: const [
                    JobTile(
                      title: "Electrician Needed",
                      location: "Kochi",
                      salary: "₹900/day",
                    ),
                    JobTile(
                      title: "Plumber Required",
                      location: "Trivandrum",
                      salary: "₹1000/day",
                    ),
                    JobTile(
                      title: "Driver for Local Travel",
                      location: "Kollam",
                      salary: "₹1200/day",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search),
          hintText: "Search jobs...",
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class JobTile extends StatelessWidget {
  final String title;
  final String location;
  final String salary;

  const JobTile({
    super.key,
    required this.title,
    required this.location,
    required this.salary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: JobsHomeScreen.primaryColor.withOpacity(0.1),
            child: const Icon(Icons.work, color: JobsHomeScreen.primaryColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  location,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            salary,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../jobs/add_job_screen.dart';

class FindJobsScreen extends StatelessWidget {
  const FindJobsScreen({super.key});

  static const Color primaryColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // 🔴 APP BAR
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Jobsify"),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: const Icon(Icons.add, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddJobScreen()),
                );
              },
            ),
          ),
        ],
      ),

      // 🧱 BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchBar(),
            const SizedBox(height: 16),
            _categoryChips(),
            const SizedBox(height: 16),
            _jobsHeader(),
            const SizedBox(height: 16),

            // 🔹 JOB CARDS (MOCK)
            _jobCard(),
            _jobCard(),
            _jobCard(),
          ],
        ),
      ),
    );
  }

  // 🔍 SEARCH BAR
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

  // 🧩 CATEGORY CHIPS
  Widget _categoryChips() {
    final categories = ["All", "Plumber", "Painter", "Driver"];

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? primaryColor : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: primaryColor),
            ),
            child: Text(
              categories[index],
              style: TextStyle(
                color: isSelected ? Colors.white : primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }

  // 📌 HEADER
  Widget _jobsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text("5 jobs available", style: TextStyle(fontWeight: FontWeight.w600)),
        Row(
          children: [
            Icon(Icons.filter_list, size: 18),
            SizedBox(width: 4),
            Text("Filter"),
          ],
        ),
      ],
    );
  }

  // 🧱 JOB CARD
  Widget _jobCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _tag("Plumber", primaryColor),
              const SizedBox(width: 6),
              _tag("URGENT", Colors.orange),
              const SizedBox(width: 6),
              _tag("Verified", Colors.green),
            ],
          ),

          const SizedBox(height: 10),

          const Text(
            "Need Plumber for Kitchen Repair",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 6),

          const Text(
            "Kitchen sink and pipe repair needed urgently. Must have 2+ years experience.",
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),

          const SizedBox(height: 10),

          Row(
            children: const [
              Icon(Icons.location_on, size: 16, color: Colors.red),
              SizedBox(width: 4),
              Text("Sector 15, Delhi"),
              Spacer(),
              Icon(Icons.access_time, size: 16, color: Colors.red),
              SizedBox(width: 4),
              Text("2 hours ago"),
            ],
          ),

          const SizedBox(height: 12),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "₹800–1000 / day",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 12),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: const Text("View Contact"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

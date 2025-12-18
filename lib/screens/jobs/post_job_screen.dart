import 'package:flutter/material.dart';

class PostJobScreen extends StatefulWidget {
  const PostJobScreen({super.key});

  @override
  State<PostJobScreen> createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {
  final _titleController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();

  String? _selectedCategory;

  final List<String> _categories = [
    "Electrician",
    "Plumber",
    "Carpenter",
    "Driver",
    "Technician",
    "Mechanic",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(title: const Text("Post a Job")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _label("Job Title"),
            _input(
              controller: _titleController,
              hint: "e.g. Electrician needed for house wiring",
            ),

            const SizedBox(height: 16),

            _label("Category"),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              items: _categories
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (v) => setState(() => _selectedCategory = v),
              decoration: const InputDecoration(
                filled: true,
                hintText: "Select category",
              ),
            ),

            const SizedBox(height: 16),

            _label("Location"),
            _input(controller: _locationController, hint: "City / Area"),

            const SizedBox(height: 16),

            _label("Job Description"),
            _input(
              controller: _descriptionController,
              hint: "Describe the job details",
              maxLines: 5,
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Submit Job", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    // v1: just show confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Job submitted (pending approval)")),
    );
    Navigator.pop(context);
  }

  Widget _label(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
  );

  Widget _input({
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
  }) => TextField(
    controller: controller,
    maxLines: maxLines,
    decoration: InputDecoration(
      hintText: hint,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

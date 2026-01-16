import 'package:flutter/material.dart';

class AddJobScreen extends StatelessWidget {
  const AddJobScreen({super.key});

  // Match Home screen theme color
  static const Color primaryColor = Color(0xFF1B0C6D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Create Your Profile"),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textField("Enter your full name"),
              const SizedBox(height: 16),

              _label("Category *"),
              _dropdown(),
              const SizedBox(height: 16),

              _label("Experience *"),
              _textField("e.g., 5 years"),
              const SizedBox(height: 16),

              _label("Location *"),
              _textField("Enter your location/area"),
              const SizedBox(height: 16),

              _label("Contact Number *"),
              _textField("+91 98765 43210", keyboard: TextInputType.phone),
              const SizedBox(height: 16),

              _label("About You"),
              _textField(
                "Tell employers about your skills and experience",
                maxLines: 4,
              ),
              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel"),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        // UI-only action for now
                        Navigator.pop(context);
                      },
                      child: const Text("Create"),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ---------- UI HELPERS ----------

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _textField(
    String hint, {
    int maxLines = 1,
    TextInputType keyboard = TextInputType.text,
  }) {
    return TextField(
      maxLines: maxLines,
      keyboardType: keyboard,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _dropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: "Plumber",
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: "Plumber", child: Text("Plumber")),
            DropdownMenuItem(value: "Electrician", child: Text("Electrician")),
            DropdownMenuItem(value: "Painter", child: Text("Painter")),
            DropdownMenuItem(value: "Driver", child: Text("Driver")),
          ],
          onChanged: (value) {},
        ),
      ),
    );
  }
}

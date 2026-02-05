class Job {
  final int id;
  final String title;
  final String category;
  final String description;
  final String location;
  final String phone;
  final String? latitude;
  final String? longitude;

  Job({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.location,
    required this.phone,
    this.latitude,
    this.longitude,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      title: json['title'] ?? '',
      category: json['category'] ?? '',
      description: json['description'] ?? '',
      location: json['location'] ?? '',
      phone: json['phone'] ?? '',
      latitude: json['latitude']?.toString(),
      longitude: json['longitude']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category': category,
      'description': description,
      'location': location,
      'phone': phone,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}

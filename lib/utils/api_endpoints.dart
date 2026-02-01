class ApiEndpoints {
  static const String baseUrl = "http://172.22.39.105:8000";

  // Auth
  static const String login = "$baseUrl/auth/login";

  // Admin - Dashboard
  static const String adminStats = "$baseUrl/admin/stats";

  // Admin - Jobs
  static const String pendingJobs = "$baseUrl/admin/jobs/pending";
  static const String approveJob = "$baseUrl/admin/jobs/approve";
  static const String rejectJob = "$baseUrl/admin/jobs/reject";

  // Admin - Providers
  static const String pendingProviders = "$baseUrl/admin/providers/pending";
  static const String approveProvider = "$baseUrl/admin/providers/approve";
  static const String rejectProvider = "$baseUrl/admin/providers/reject";

  // Admin - Reports
  static const String reports = "$baseUrl/admin/reports";
  static const String takeReportAction = "$baseUrl/admin/reports/action";

  // Admin - Users
  static const String users = "$baseUrl/admin/users";
  static const String blockUser = "$baseUrl/admin/users/block";
}

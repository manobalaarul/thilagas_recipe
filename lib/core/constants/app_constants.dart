class ApiConstants {
  static const String baseUrl = "https://server.thilagasrecipe.in/api/";
  static const int connectionTimeout = 2; // 2 minutes
  static const int receiveTimeout = 3; // 3 minutes

  // Error Messages
  static const String serverError = 'Server Error';
  static const String connectionError = 'Connection Error';
  static const String invalidResponse = 'Invalid Response';
}

class AppConstants {
  //Shared Preferences
  static const String accessToken = "accessToken";
  static const String refreshToken = "refreshToken";
  static const String name = "userName";
  static const String email = "userEmail";
}

class APIEndPoints {
  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);

  // static String baseUrl = "http://localhost:5000/api/";
  // static String baseUrl = "http://192.168.1.71:5000/api/";
  static String baseUrl = "http://192.168.42.9:5000/api/";
  static String mediaUrl = "http://192.168.42.9:5000/uploads/";
  static String loginUrl = "auth/login";
  static String signUpUrl = "auth/signup";
  static String workOutsUrl = "workouts";
  static String meUrl = "auth/me";
  static String logOutUrl = "auth/logout";
  static String editProfileUrl = "users/profile";
}

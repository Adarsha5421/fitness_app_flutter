class APIEndPoints {
  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);

  // static String baseUrl = "http://localhost:5000/api/";
  static String baseUrl = "http://192.168.1.71/api/";
  static String loginUrl = "auth/login";
  static String signUpUrl = "auth/signup";
  static String meUrl = "auth/me";
  static String logOutUrl = "auth/logout";
  static String editProfileUrl = "auth/editprofile";
}

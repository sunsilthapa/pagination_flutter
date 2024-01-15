class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "https://jsonplaceholder.typicode.com/";
  static const String comments = "comments";
  static const String photos = "photos";

  static const limitPage = 10;
}

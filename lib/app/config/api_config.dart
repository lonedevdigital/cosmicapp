class ApiConfig {
  // Base URL utama
  static const String baseUrl = "https://lonedev.my.id/api/v1";
  static const String apiKey = "123"; // ganti sesuai yang kamu pakai
  static const String registerPath = "/users/register";
  static const String loginPath = "/users/login";

  // USER/AUTH Endpoints
  static const String login = "$baseUrl/login";
  static const String register = "$baseUrl/register";
  static const String userProfile = "$baseUrl/userProfile";

  // MANGA Endpoints
  static const String heroSlider = "$baseUrl/heroslider";
  static const String rekomendasi = "$baseUrl/rekomendasi";
  static const String popularToday = "$baseUrl/popularToday";
  static const String project = "$baseUrl/project";
  static const String latest = "$baseUrl/latest";
  static const String searchManga = "$baseUrl/searchManga";
  static const String bookmark = "$baseUrl/bookmark";

  // Dynamic Endpoints (detail, chapter, etc)
  static String seriesDetail(String slug) => "$baseUrl/seriesDetail/$slug";
  static String readingPage(String slug) => "$baseUrl/readingPage/$slug";
}

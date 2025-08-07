// lib/app/routes/app_routes.dart
class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';

  // Add the getters that your code is expecting
  static String get loginPath => login;
  static String get registerPath => register;
  static String get homePath => home;
  static String get splashPath => splash;
}
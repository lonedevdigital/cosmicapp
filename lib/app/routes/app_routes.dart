class AppRoutes {
  // === Path ===
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';

  // === Name ===
  static const String splashName = 'splash';
  static const String loginName = 'login';
  static const String registerName = 'register';
  static const String homeName = 'home';

  // === Getters (opsional, hanya untuk konsistensi nama) ===
  static String get splashPath => splash;
  static String get loginPath => login;
  static String get registerPath => register;
  static String get homePath => home;
}

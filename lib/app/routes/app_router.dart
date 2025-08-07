import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Page imports
import 'package:cosmicscans/presentation/splash/pages/splash_page.dart';
import 'package:cosmicscans/presentation/auth/pages/login_page.dart';
import 'package:cosmicscans/presentation/auth/pages/register_page.dart';
import 'package:cosmicscans/presentation/home/pages/home_page.dart';
// Tambahkan import halaman lainnya jika dibutuhkan

import 'app_routes.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.splashPath,
  routes: [
    // Splash
    GoRoute(
      path: AppRoutes.splashPath,
      name: AppRoutes.splashName,
      builder: (context, state) => const SplashPage(),
    ),

    // Login
    GoRoute(
      path: AppRoutes.loginPath,
      name: AppRoutes.loginName,
      builder: (context, state) => const LoginPage(),
    ),

    // Register
    GoRoute(
      path: AppRoutes.registerPath,
      name: AppRoutes.registerName,
      builder: (context, state) => const RegisterPage(),
    ),

    // Home
    GoRoute(
      path: AppRoutes.homePath,
      name: AppRoutes.homeName,
      builder: (context, state) => const HomePage(),
    ),
  ],
  errorBuilder: (context, state) => const Scaffold(
    body: Center(child: Text('Halaman tidak ditemukan')),
  ),
);

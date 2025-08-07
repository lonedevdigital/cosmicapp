// lib/app/utils/logout_helper.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cosmicscans/app/routes/app_routes.dart';

Future<void> performLogout(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear(); // Hapus token & user

  if (context.mounted) {
    context.go(AppRoutes.loginPath); // Arahkan ke login
  }
}

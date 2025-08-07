import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cosmicscans/app/app.dart';
import 'package:cosmicscans/presentation/auth/providers/register_provider.dart';
// Tambahkan provider lain di sini jika ada

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        // Tambahkan provider lainnya di sini jika perlu
      ],
      child: const MyApp(),
    ),
  );
}

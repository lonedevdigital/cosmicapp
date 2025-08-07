import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cosmicscans/app/app.dart';
import 'package:cosmicscans/presentation/auth/providers/login_provider.dart';
import 'package:cosmicscans/presentation/auth/providers/register_provider.dart';
import 'package:cosmicscans/presentation/home/providers/home_provider.dart'; // ⬅️ tambahkan ini

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()), // ⬅️ Tambahkan ini
      ],
      child: const MyApp(),
    ),
  );
}

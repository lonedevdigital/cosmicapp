import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cosmicscans/app/app.dart';
import 'package:cosmicscans/presentation/auth/providers/login_provider.dart';
import 'package:cosmicscans/presentation/auth/providers/register_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        // Tambahkan provider lainnya jika ada
      ],
      child: const MyApp(),
    ),
  );
}

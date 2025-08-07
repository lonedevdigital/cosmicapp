import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cosmicscans/app/routes/app_routes.dart';
import 'package:cosmicscans/presentation/shared/styles/app_colors.dart';
import 'package:cosmicscans/presentation/shared/styles/app_text_styles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) context.go(AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.splashGradientStart, AppColors.splashGradientEnd],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Keyakinan merupakan suatu pengetahuan dalam hati...",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.splashQuote,
                ),
                const SizedBox(height: 100),
                Image.asset(
                  'assets/images/cosmic_toon_logo.png',
                  height: 60,
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

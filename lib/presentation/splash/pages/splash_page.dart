import 'dart:math';

import 'package:cosmicscans/app/routes/app_routes.dart';
import 'package:cosmicscans/presentation/auth/providers/login_provider.dart';
import 'package:cosmicscans/presentation/shared/styles/app_colors.dart';
import 'package:cosmicscans/presentation/shared/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final List<String> splashTexts = [
    'Dalam dunia yang sibuk dan melelahkan, luangkan waktu untuk dirimu sendiri. Kadang, diam dan menikmati momen adalah bentuk cinta terbesar pada hidup.',

    'Hidup tidak selalu tentang berlari cepat, kadang ia tentang menikmati setiap langkah — bahkan yang paling pelan sekalipun.',

    'Tak apa jika hari ini terasa berat. Kamu hanya manusia yang sedang belajar bertahan, dan itu sudah cukup luar biasa.',

    'Setiap cerita yang kamu baca bisa menjadi pelipur lara, karena di balik setiap halaman, ada kedamaian yang mungkin sedang kamu cari.',

    'Keyakinan merupakan suatu pengetahuan dalam hati, jauh tak terjangkau oleh bukti',
  ];

  late String displayedText;

  @override
  void initState() {
    super.initState();
    displayedText = splashTexts[Random().nextInt(splashTexts.length)];
    _setupAnimation();
    _startApp();
  }

  void _setupAnimation() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _animationController.forward();
  }

  Future<void> _startApp() async {
    await Future.delayed(const Duration(milliseconds: 1800));

    final loginProvider = context.read<LoginProvider>();
    final success = await loginProvider.tryAutoLogin();

    if (!mounted) return;

    if (success) {
      context.go(AppRoutes.homePath);
    } else {
      context.go(AppRoutes.loginPath);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.splashGradientStart, // Using app theme colors
              AppColors.splashGradientEnd,   // Using app theme colors
            ],
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              children: [
                // Main content area
                Expanded(
                  child: Container(),
                ),

                // Text content positioned at bottom
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    displayedText,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.splashQuote.copyWith(
                      fontSize: screenWidth * 0.04,
                      height: 1.4,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Logo at bottom right
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/cosmic_toon_logo.png',
                          width: 150,
                          height: 150,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
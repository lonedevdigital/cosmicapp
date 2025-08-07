import 'package:cosmicscans/presentation/shared/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  // Splash screen quote
  static const TextStyle splashQuote = TextStyle(
    color: AppColors.textLight,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );

  // Headlines
  static const TextStyle headline1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textLight,
    fontFamily: 'Montserrat',
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textLight,
    fontFamily: 'Montserrat',
  );

  static const TextStyle headline3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textLight,
    fontFamily: 'Montserrat',
  );

  static final TextStyle heading3 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    fontFamily: 'Montserrat',
  );

  // Body text
  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    color: AppColors.textLight,
    fontFamily: 'Roboto',
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14,
    color: AppColors.textGrey,
    fontFamily: 'Roboto',
  );

  // Button text
  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textLight,
    fontFamily: 'Montserrat',
  );

  // Caption/small
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: AppColors.textGrey,
    fontFamily: 'Roboto',
  );

  // Comic title (card/list)
  static const TextStyle comicTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textLight,
    fontFamily: 'Montserrat',
  );

  static const TextStyle chapterInfo = TextStyle(
    fontSize: 13,
    color: AppColors.textGrey,
    fontFamily: 'Roboto',
  );

  // 💡 Tambahan agar tidak error saat dipanggil dari home_page.dart

  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.textLight,
    fontFamily: 'Montserrat',
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textLight,
    fontFamily: 'Montserrat',
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: AppColors.textLight,
    fontFamily: 'Roboto',
  );
}

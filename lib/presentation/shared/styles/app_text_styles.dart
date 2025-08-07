import 'package:cosmicscans/presentation/shared/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  // Splash screen text style
  static const TextStyle splashQuote = TextStyle(
    color: AppColors.textLight,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );

  // Headlines
  static const TextStyle headline1 = TextStyle(
    color: AppColors.textLight,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
  );

  static const TextStyle headline2 = TextStyle(
    color: AppColors.textLight,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
  );

  static const TextStyle headline3 = TextStyle(
    color: AppColors.textLight,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
  );

  // Body Text
  static const TextStyle bodyText1 = TextStyle(
    color: AppColors.textLight,
    fontSize: 16,
    fontFamily: 'Roboto',
  );

  static const TextStyle bodyText2 = TextStyle(
    color: AppColors.textGrey,
    fontSize: 14,
    fontFamily: 'Roboto',
  );

  // Button Text
  static const TextStyle buttonText = TextStyle(
    color: AppColors.textLight,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );

  // Caption/Small Text
  static const TextStyle caption = TextStyle(
    color: AppColors.textGrey,
    fontSize: 12,
    fontFamily: 'Roboto',
  );

  // Example for comic titles
  static const TextStyle comicTitle = TextStyle(
    color: AppColors.textLight,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );

  // Example for chapter info
  static const TextStyle chapterInfo = TextStyle(
    color: AppColors.textGrey,
    fontSize: 13,
    fontFamily: 'Roboto',
  );

  static final TextStyle heading3 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary, // Now this will work!
  );
}
import 'package:flutter/material.dart';

class AppColors {
  // Primary & Accent Colors
  static const Color primary = Color(
    0xFFBA55D3,
  ); // Warna ungu utama yang dominan
  static const Color primaryDark = Color(
    0xFF8A2BE2,
  ); // Ungu yang sedikit lebih gelap, untuk gradien atau variasi
  static const Color accent = Color(
    0xFFE0BBE4,
  ); // Warna aksen yang lebih terang, mungkin untuk highlight kecil

  // Background Colors
  static const Color background = Color(
    0xFF121212,
  ); // Hampir hitam, sangat gelap
  static const Color cardBackground = Color(
    0xFF1E1E1E,
  ); // Sedikit lebih terang dari background, untuk card/elemen
  static const Color inputFieldBackground = Color(
    0xFF2C2C2C,
  ); // Background untuk input field

  // Text Colors
  static const Color textLight = Colors.white; // Teks utama terang
  static const Color textGrey = Color(
    0xFFAAAAAA,
  ); // Teks abu-abu untuk hint, deskripsi
  static const Color textDark =
      Colors.black; // Mungkin tidak terlalu banyak dipakai, tapi disiapkan

  // Specific UI Colors
  static const Color buttonGradientStart = Color(
    0xFFBA55D3,
  ); // Awal gradien tombol (dari desain login/register)
  static const Color buttonGradientEnd = Color(
    0xFF8A2BE2,
  ); // Akhir gradien tombol

  // Splash Screen specific colors (sesuai splashscreen.jpg)
  static const Color splashGradientStart = Color(
    0xFF8A2BE2,
  ); // Ungu awal gradien
  static const Color splashGradientEnd = Color(
    0xFFC700FF,
  ); // Ungu akhir gradien

  // Lain-lain
  static const Color success = Color(0xFF4CAF50); // Hijau untuk sukses
  static const Color error = Color(0xFFF44336); // Merah untuk error
  static const Color warning = Color(0xFFFFC107);

  static var textPrimary;

  static var white; // Kuning untuk warning
}

import 'package:equatable/equatable.dart';
import 'chapter.dart'; // ⬅️ Tambahkan ini kalau belum

class Comic extends Equatable {
  final String title;
  final String slug;
  final String cover;
  final String? badge;
  final String genre;
  final String rating;
  final List<Chapter> chapters; // ⬅️ Properti penting

  const Comic({
    required this.title,
    required this.slug,
    required this.cover,
    required this.badge,
    required this.genre,
    required this.rating,
    this.chapters = const [], // ⬅️ Default kosong
  });

  @override
  List<Object?> get props => [title, slug, cover, badge, genre, rating, chapters];
}

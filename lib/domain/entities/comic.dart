import 'package:cosmicscans/domain/entities/chapter.dart'; // Import entitas Chapter
import 'package:equatable/equatable.dart';

class Comic extends Equatable {
  final String title;
  final String cover;
  final String slug;
  final String? badge; // Nullable
  final String? genre; // Nullable
  final String? rating; // Nullable
  final List<Chapter>? dataChapter; // Nullable, untuk project/latest

  const Comic({
    required this.title,
    required this.cover,
    required this.slug,
    this.badge,
    this.genre,
    this.rating,
    this.dataChapter,
  });

  @override
  List<Object?> get props => [
    title,
    cover,
    slug,
    badge,
    genre,
    rating,
    dataChapter,
  ];
}

import 'package:equatable/equatable.dart';

class Chapter extends Equatable {
  final String chapter;       // slug atau judul chapter
  final int chapterNum;       // nomor chapter (opsional untuk penanda)
  final String timeAgo;       // keterangan waktu (misal: "2 hours ago")
  final bool isNew;           // penanda jika chapter baru

  const Chapter({
    required this.chapter,
    required this.chapterNum,
    required this.timeAgo,
    this.isNew = false,
  });

  factory Chapter.fromMap(Map<String, dynamic> map) {
    return Chapter(
      chapter: map['chapter'] as String? ?? '',
      chapterNum: map['chapterNum'] as int? ?? 0,
      timeAgo: map['timeAgo'] as String? ?? '',
      isNew: map['isNew'] as bool? ?? false,
    );
  }

  @override
  List<Object?> get props => [chapter, chapterNum, timeAgo, isNew];
}

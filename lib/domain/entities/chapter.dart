import 'package:equatable/equatable.dart';

class Chapter extends Equatable {
  final String chapters; // slug chapter
  final int chapterNum;
  final String time;

  const Chapter({
    required this.chapters,
    required this.chapterNum,
    required this.time,
  });

  @override
  List<Object?> get props => [chapters, chapterNum, time];
}

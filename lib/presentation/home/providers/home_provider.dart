import 'package:flutter/material.dart';
import 'package:cosmicscans/domain/entities/comic.dart';
import 'package:cosmicscans/domain/entities/chapter.dart';

class HomeProvider extends ChangeNotifier {
  // Slider komik unggulan
  final List<Comic> heroSlider = [
    Comic(
      title: 'Martial Art Evolution: Awakening',
      slug: 'martial-art-evolution-awakening',
      cover: 'https://i0.wp.com/faceentry.my.id/wp-content/uploads/2025/08/Cover.jpeg',
      badge: 'HOT',
      genre: 'Martial Arts',
      rating: '4.6',
      chapters: [],
    ),
    Comic(
      title: 'Lookism',
      slug: 'lookism',
      cover: 'https://faceentry.my.id/wp-content/uploads/2025/08/Gaya-Rock.jpg',
      badge: 'Popular',
      genre: 'Drama',
      rating: '4.8',
      chapters: [],
    ),
    Comic(
      title: 'Trinity Seven',
      slug: 'trinity-seven',
      cover: 'https://faceentry.my.id/wp-content/uploads/2025/08/trinity-seven.jpg',
      badge: null,
      genre: 'Magic / School',
      rating: '4.7',
      chapters: [],
    ),
  ];

  // Project list dengan data chapter
  final List<Comic> projectList = [
    Comic(
      title: 'Demon Slayer',
      slug: 'demon-slayer',
      cover: 'https://faceentry.my.id/wp-content/uploads/2025/08/demon-slayer.jpg',
      badge: null,
      genre: 'Action / Supernatural',
      rating: '9.5',
      chapters: [
        Chapter(chapter: 'Chapter 102', chapterNum: 102, timeAgo: '1 hour ago', isNew: true),
        Chapter(chapter: 'Chapter 101', chapterNum: 101, timeAgo: '1 day ago', isNew: false),
      ],
    ),
    Comic(
      title: 'Attack on Titan',
      slug: 'attack-on-titan',
      cover: 'https://faceentry.my.id/wp-content/uploads/2025/08/attack-on-titan.jpg',
      badge: null,
      genre: 'Action / Drama',
      rating: '9.2',
      chapters: [
        Chapter(chapter: 'Chapter 156', chapterNum: 156, timeAgo: '2 hours ago', isNew: true),
        Chapter(chapter: 'Chapter 155', chapterNum: 155, timeAgo: '3 days ago', isNew: false),
      ],
    ),
    Comic(
      title: 'One Piece',
      slug: 'one-piece',
      cover: 'https://faceentry.my.id/wp-content/uploads/2025/08/one-piece.jpeg',
      badge: null,
      genre: 'Adventure / Comedy',
      rating: '9.8',
      chapters: [
        Chapter(chapter: 'Chapter 1089', chapterNum: 1089, timeAgo: '30 minutes ago', isNew: true),
        Chapter(chapter: 'Chapter 1088', chapterNum: 1088, timeAgo: '1 week ago', isNew: false),
      ],
    ),
    Comic(
      title: 'Jujutsu Kaisen',
      slug: 'jujutsu-kaisen',
      cover: 'https://faceentry.my.id/wp-content/uploads/2025/08/jujutsu-kaisen.png',
      badge: null,
      genre: 'Supernatural / School',
      rating: '9.1',
      chapters: [
        Chapter(chapter: 'Chapter 245', chapterNum: 245, timeAgo: '45 minutes ago', isNew: true),
        Chapter(chapter: 'Chapter 244', chapterNum: 244, timeAgo: '2 days ago', isNew: false),
      ],
    ),
    Comic(
      title: 'Tokyo Ghoul',
      slug: 'tokyo-ghoul',
      cover: 'https://faceentry.my.id/wp-content/uploads/2025/08/tokyo-ghoul.jpg',
      badge: null,
      genre: 'Horror / Supernatural',
      rating: '8.9',
      chapters: [
        Chapter(chapter: 'Chapter 178', chapterNum: 178, timeAgo: '3 hours ago', isNew: true),
        Chapter(chapter: 'Chapter 177', chapterNum: 177, timeAgo: '5 days ago', isNew: false),
      ],
    ),
  ];

  // Komik populer hari ini
  final List<Comic> popularToday = [
    Comic(
      title: 'Demonic Emperor',
      slug: 'demonic-emperor',
      cover: 'https://i0.wp.com/faceentry.my.id/wp-content/uploads/2025/08/Cover.jpeg',
      badge: null,
      genre: 'Fantasy',
      rating: '4.4',
      chapters: [],
    ),
    Comic(
      title: 'Killing Peter',
      slug: 'killing-peter',
      cover: 'https://faceentry.my.id/wp-content/uploads/2025/08/kiling-peter.jpg',
      badge: null,
      genre: 'Action',
      rating: '4.3',
      chapters: [],
    ),
    Comic(
      title: 'Demon Iruma Kun',
      slug: 'demon-iruma-kun',
      cover: 'https://faceentry.my.id/wp-content/uploads/2025/08/demon-iruma.jpg',
      badge: 'New',
      genre: 'Comedy / Supernatural',
      rating: '4.5',
      chapters: [],
    ),
  ];

  // Komik update terbaru
  final List<Comic> newUpdated = [
    Comic(
      title: 'Lookism',
      slug: 'lookism',
      cover: 'https://faceentry.my.id/wp-content/uploads/2025/08/Gaya-Rock.jpg',
      badge: 'Popular',
      genre: 'Drama',
      rating: '4.8',
      chapters: [],
    ),
    Comic(
      title: 'Martial Art Evolution: Awakening',
      slug: 'martial-art-evolution-awakening',
      cover: 'https://i0.wp.com/faceentry.my.id/wp-content/uploads/2025/08/Cover.jpeg',
      badge: 'HOT',
      genre: 'Martial Arts',
      rating: '4.6',
      chapters: [],
    ),
    Comic(
      title: 'Demon Iruma Kun',
      slug: 'demon-iruma-kun',
      cover: 'https://faceentry.my.id/wp-content/uploads/2025/08/demon-iruma.jpg',
      badge: 'New',
      genre: 'Comedy / Supernatural',
      rating: '4.5',
      chapters: [],
    ),
  ];
}

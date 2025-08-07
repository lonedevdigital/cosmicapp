import 'dart:ui';

import 'package:cosmicscans/domain/entities/comic.dart';
import 'package:flutter/material.dart';
import 'package:cosmicscans/presentation/shared/styles/app_text_styles.dart';

class HeroSliderWidget extends StatelessWidget {
  final List<Comic> comics;

  const HeroSliderWidget({super.key, required this.comics});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final safeAreaTop = padding.top;

    final sliderHeight = screenSize.height * 0.45;
    final searchBarTop = safeAreaTop + 20;
    final contentBottomPadding = screenSize.height * 0.08;

    return SizedBox(
      height: sliderHeight,
      child: Stack(
        children: [
          // Background slider
          PageView.builder(
            itemCount: comics.length,
            controller: PageController(viewportFraction: 1.0),
            itemBuilder: (context, index) {
              final comic = comics[index];

              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    comic.cover,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.3),
                          Colors.black.withOpacity(0.7),
                        ],
                        stops: const [0.0, 0.5, 1.0],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: contentBottomPadding,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          comic.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.titleMedium.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: screenSize.width > 600 ? 28 : 22,
                            height: 1.2,
                            shadows: const [
                              Shadow(
                                color: Colors.black87,
                                blurRadius: 8,
                                offset: Offset(0, 2),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.015),
                        Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          children: [
                            _buildGenreTag('Action', Colors.red.shade600, screenSize),
                            _buildGenreTag('Fantasy', Colors.purple.shade600, screenSize),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          // Top overlay: Transparent search bar and notification
          Positioned(
            top: searchBarTop,
            left: 20,
            right: 20,
            child: Row(
              children: [
                // Transparent search bar
                Expanded(
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        width: 1.5,
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: TextField(
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            cursorColor: Colors.white70,
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.65),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 16, right: 12),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white.withOpacity(0.8),
                                  size: 18,
                                ),
                              ),
                              prefixIconConstraints: const BoxConstraints(
                                minWidth: 46,
                                minHeight: 18,
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 16, left: 12),
                                child: Icon(
                                  Icons.tune,
                                  color: Colors.white.withOpacity(0.8),
                                  size: 18,
                                ),
                              ),
                              suffixIconConstraints: const BoxConstraints(
                                minWidth: 46,
                                minHeight: 18,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Transparent notification bell
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      width: 1.5,
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Icon(
                          Icons.notifications_outlined,
                          color: Colors.white.withOpacity(0.9),
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenreTag(String genre, Color color, Size screenSize) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.03,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        genre,
        style: TextStyle(
          color: Colors.white,
          fontSize: screenSize.width > 600 ? 13 : 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
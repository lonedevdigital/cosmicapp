import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cosmicscans/presentation/home/providers/home_provider.dart';
import 'package:cosmicscans/presentation/shared/styles/app_colors.dart';
import 'package:cosmicscans/presentation/shared/styles/app_text_styles.dart';
import 'package:cosmicscans/presentation/home/widgets/hero_slider_widget.dart';
import 'package:cosmicscans/presentation/home/widgets/comic_list_widget.dart';
import 'package:cosmicscans/presentation/home/widgets/project_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          /// Hero Slider
          HeroSliderWidget(comics: homeProvider.heroSlider),



          /// Section: Popular Today
          ComicListWidget(
            title: 'Popular Today',
            comics: homeProvider.popularToday,
            onSeeAll: () {
              // TODO: navigasi ke halaman popular lengkap
            },
          ),

          /// Section: Project List
          ProjectListWidget(
            title: 'Project',
            comics: homeProvider.projectList,
            onSeeAll: () {
              // TODO: navigasi ke halaman project lengkap
            },
          ),

          /// Section: New Updated
          ComicListWidget(
            title: 'New Updated',
            comics: homeProvider.newUpdated,
            onSeeAll: () {
              // TODO: navigasi ke halaman update lengkap
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.background,
        selectedItemColor: AppColors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          // TODO: navigasi ke halaman lain
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Bookmark'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
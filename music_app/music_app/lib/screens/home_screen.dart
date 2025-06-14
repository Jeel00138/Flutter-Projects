import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/screens/search_screen.dart';
import 'package:music_app/screens/details_screen.dart';
import 'package:music_app/Widgets/album_card.dart';
import 'package:music_app/app_colors.dart';
import 'package:music_app/app_text_styles.dart';
import 'package:music_app/Widgets/favorite_list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 20.0),
        child: ListView(
          children: [
            // Welcome back! with icons
            Row(
              children: [
                const Text("Welcome back!", style: AppTextStyles.heading),
                const Spacer(), // automatic gap between text and icons
                SvgPicture.asset('lib/constants/assets/icon/library.svg', color: Colors.white70, height: 30),
                const SizedBox(width: 10),
                SvgPicture.asset('lib/constants/assets/icon/setting.svg', color: Colors.white70, height: 30),
              ],
            ),

            const SizedBox(height: 4),
            const Text("What do you feel like today?", style: AppTextStyles.subheading),
            const SizedBox(height: 20),

      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SearchScreen()),
          );
        },

            // Search Bar
            child:Container(
              decoration: BoxDecoration(
                color: AppColors.searchBar,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  SvgPicture.asset('lib/constants/assets/icon/search.svg', color: Colors.white70, height: 20),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: TextField(
                      //readOnly: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Search song, playlist, artist...",
                        hintStyle: TextStyle(color: Colors.white54),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
      ),
            const SizedBox(height: 20),

            // Category Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryTab("Recent", true),
                _buildCategoryTab("Top 50", false),
                _buildCategoryTab("Chill", false),
                _buildCategoryTab("R&B", false),
                _buildCategoryTab("Festival", false),
              ],
            ),

            const SizedBox(height: 20),

            // Album Carousel
            SizedBox(
              height: 223,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  final albumData = [
                    {"title": "Dangerous Days", "year": "2014", "type": "Album", "image": "lib/constants/assets/images/home/a1.png"},
                    {"title": "Violator (Deluxe)", "year": "1990", "type": "Album", "image": "lib/constants/assets/images/home/a2.png"},
                    {"title": "Purple Rain", "year": "1984", "type": "Album", "image": "lib/constants/assets/images/home/a3.jpg"},
                    {"title": "Random Access Memories", "year": "2013", "type": "Album", "image": "lib/constants/assets/images/home/a4.png"},
                    {"title": "The Wall", "year": "1979", "type": "Album", "image": "lib/constants/assets/images/home/a5.jpg"},
                    {"title": "The Dark Side of the Moon", "year": "1973", "type": "Album", "image": "lib/constants/assets/images/home/a6.jpg"},
                    {"title": "Thriller", "year": "1982", "type": "Album", "image": "lib/constants/assets/images/home/a7.png"},
                  ];
                  final album = albumData[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailsScreen(), // Change to AlbumDetailsScreen() if you renamed it
                        ),
                      );
                    },
                    child: AlbumCard(
                      title: album["title"]!,
                      year: album["year"]!,
                      type: album["type"]!,
                      imageUrl: album["image"]!,
                    ),
                  );

                },
              ),
            ),

            const SizedBox(height: 20),

            // Your favorites title
            const Text(
              "Your favorites",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10),
            FavoriteListItem(
              title: "Tardes de Melancolía",
              artist: "Indios",
              duration: "3:30",
              imagePath: "lib/constants/assets/images/home/tarades1.jpg",
            ),
            FavoriteListItem(
              title: "A Man Without Love",
              artist: "Engelbert Humperdinck",
              duration: "3:23",
              imagePath: "lib/constants/assets/images/home/Aman2.jpg",
            ),
            FavoriteListItem(
              title: "Rosanna",
              artist: "TOTO",
              duration: "5:31",
              imagePath: "lib/constants/assets/images/home/rosanna3.jpg",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTab(String title, bool isActive) {
    return Column(
      children: [
        Text(
          title,
          style: isActive ? AppTextStyles.tabActive : AppTextStyles.tabInactive,
        ),
        if (isActive)
          Container(
            margin: const EdgeInsets.only(top: 4),
            height: 3,
            width: 46,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF8D1CFE),
                  Color(0xFF0038ED),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
      ],
    );
  }
}

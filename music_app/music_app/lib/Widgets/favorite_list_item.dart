import 'package:flutter/material.dart';
import 'package:music_app/app_text_styles.dart';

class FavoriteListItem extends StatelessWidget {
  final String title;
  final String artist;
  final String duration;
  final String imagePath;

  const FavoriteListItem({
    Key? key,
    required this.title,
    required this.artist,
    required this.duration,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.favoriteTitle),
                Text(artist, style: AppTextStyles.favoriteSubtitle),
              ],
            ),
          ),
          Text(duration, style: AppTextStyles.favoriteSubtitle),
        ],
      ),
    );
  }
}

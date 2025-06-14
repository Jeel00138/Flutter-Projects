import 'package:flutter/material.dart';

class PlayerPage extends StatelessWidget {
  final String songTitle;
  final String artist;

  const PlayerPage({super.key, required this.songTitle, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D0053),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back, color: Colors.white),
                  Column(
                    children: const [
                      Text("Playing from the album", style: TextStyle(color: Colors.white70)),
                      Text("Dangerous Days", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Icon(Icons.more_vert, color: Colors.white),
                ],
              ),
            ),

            // Album Art
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset("lib/constants/assets/images/home/a1.png"), // Make sure this image is in your assets
              ),
            ),

            // Song Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(songTitle, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                      Text(artist, style: const TextStyle(fontSize: 16, color: Colors.white70)),
                    ],
                  ),
                  const Icon(Icons.favorite_border, color: Colors.white),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Slider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Slider(value: 0.7, onChanged: (value) {}, activeColor: Colors.white),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("3:13", style: TextStyle(color: Colors.white70)),
                      Text("4:49", style: TextStyle(color: Colors.white70)),
                    ],
                  )
                ],
              ),
            ),

            const Spacer(),

            // Controls
            Padding(
              padding: const EdgeInsets.only(bottom: 120.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.shuffle, color: Colors.white),
                  const Icon(Icons.skip_previous, size: 36, color: Colors.white),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(colors: [Colors.purple, Colors.blue]),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.play_arrow),
                      iconSize: 36,
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                  const Icon(Icons.skip_next, size: 36, color: Colors.white),
                  const Icon(Icons.repeat, color: Colors.white),
                  Column(
                    children: const [
                      SizedBox(height: 8),
                      Icon(Icons.share, color: Colors.white),
                     // Icon(Icons.share, color: Colors.white),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

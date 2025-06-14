import 'package:flutter/material.dart';
import 'package:music_app/screens/play_screen.dart'; // Make sure this is the correct path

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF5C0453),
              Color(0xFF10053B),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),

              // Album image
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage('lib/constants/assets/images/home/a1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Album title and artist aligned left
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dangerous Days",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Perturbator",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Row of icons: 3 on left, 2 on right
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.favorite_border, color: Colors.white),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.more_vert, color: Colors.white),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.download, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.shuffle, color: Colors.white),
                          onPressed: () {},
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.purple, Colors.blue],
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.play_arrow, color: Colors.white),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Song list
              Expanded(
                child: ListView(
                  children: [
                    const SongTile(title: "Welcome Back"),
                    const SongTile(title: "Perturbator’s Theme"),
                    const SongTile(title: "Raw Power"),

                    // 👇 Tap on this navigates to PlayScreen
                    SongTile(
                      title: "Future Club",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PlayerPage(
                              songTitle: "Future Club",
                              artist: "Perturbator",
                            ),
                          ),
                        );
                      },
                    ),

                    const SongTile(title: "War Against Machines"),
                    const SongTile(title: "Hard Wired (feat. Isabella Goloversic)"),
                    const SongTile(title: "Humans are Such Easy Prey"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ✅ Updated to support onTap
class SongTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const SongTile({
    required this.title,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title, style: const TextStyle(color: Colors.white)),
        subtitle: const Text("Perturbator", style: TextStyle(color: Colors.white70)),
        trailing: const Icon(Icons.more_vert, color: Colors.white),
        onTap: onTap,
        );
    }
}
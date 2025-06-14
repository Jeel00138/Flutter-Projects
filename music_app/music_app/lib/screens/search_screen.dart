import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/app_colors.dart';
import 'package:music_app/app_text_styles.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String query = '';

  final List<Map<String, String>> artists = [
    {"name": "Perturbator", "image": "lib/constants/assets/images/search/perturbator1.png"},
    {"name": "Gorillaz", "image": "lib/constants/assets/images/search/gorillaz2.png"},
    {"name": "Weeknd", "image": "lib/constants/assets/images/search/weeknd3.jpg"},
    {"name": "Eve", "image": "lib/constants/assets/images/search/eve4.jpg"},
    {"name": "Poom", "image": "lib/constants/assets/images/search/poom5.jpg"},
    {"name": "Miki", "image": "lib/constants/assets/images/search/miki6.jpg"},
    {"name": "Abba", "image": "lib/constants/assets/images/search/abba7.jpg"},
    {"name": "Shakira", "image": "lib/constants/assets/images/search/shakira8.jpg"},
  ];

  final List<Map<String, String>> genres = [
    {"name": "Pop", "image": "lib/constants/assets/images/search/pop1.png"},
    {"name": "K-pop", "image": "lib/constants/assets/images/search/kpop2.png"},
    {"name": "Sleep", "image": "lib/constants/assets/images/search/sleep3.png"},
    {"name": "Rock", "image": "lib/constants/assets/images/search/rock4.png"},
    {"name": "Jazz", "image": "lib/constants/assets/images/search/jazz5.png"},
    {"name": "Raggae", "image": "lib/constants/assets/images/search/raggae6.png"},
    {"name": "Raggaeton", "image": "lib/constants/assets/images/search/raggaeton7.png"},
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredArtists = artists.where((artist) {
      return artist['name']!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    final filteredGenres = genres.where((genre) {
      return genre['name']!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: ListView(
          children: [
            // Top row: Search & Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Search", style: AppTextStyles.heading),
                Row(
                  children: [
                    SvgPicture.asset('lib/constants/assets/icon/library.svg', color: Colors.white70, height: 30),
                    const SizedBox(width: 10),
                    SvgPicture.asset('lib/constants/assets/icon/setting.svg', color: Colors.white70, height: 30),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "What do you want to listen to?",
              style: AppTextStyles.subheading,
            ),
            const SizedBox(height: 16),

            // Search bar
            Container(
              decoration: BoxDecoration(
                color: AppColors.searchBar,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'lib/constants/assets/icon/search.svg',
                    color: Colors.white70,
                    height: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Search song, playlist, artist...",
                        hintStyle: TextStyle(color: Colors.white54),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          query = value;
                        });
                      },
                    ),
                  ),
                  if (query.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        _searchController.clear();
                        setState(() {
                          query = '';
                        });
                      },
                      child: const Icon(Icons.close, color: Colors.white),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Artists section (moved up!)
            if (filteredArtists.isNotEmpty) ...[
              const Text("Artists", style: AppTextStyles.albumTitle),
              const SizedBox(height:12),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: filteredArtists.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (_, index) {
                    final artist = filteredArtists[index];
                    return _buildArtistCard(artist['name']!, artist['image']!);
                  },
                ),
              ),
              const SizedBox(height: 24),
            ],

            // Browse all section (after artists)
            if (filteredGenres.isNotEmpty) ...[
              const Text("Browse All", style: AppTextStyles.albumTitle),
              const SizedBox(height: 12),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: filteredGenres.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (_, index) {
                    final genre = filteredGenres[index];
                    return _buildGenreCard(genre['name']!, genre['image']!);
                  },
                ),
              ),
            ],

            // No results
            if (filteredArtists.isEmpty && filteredGenres.isEmpty && query.isNotEmpty)
              const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Center(
                  child: Text(
                    "No results found",
                    style: TextStyle(color: Colors.white54, fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenreCard(String name, String imagePath) {
    return InkWell(
      onTap: () {
        print("Tapped genre: $name");
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(8),
      ),
    );
  }

  Widget _buildArtistCard(String name, String imagePath) {
    return Stack(
      children: [
        Container(
          width: 120,
          decoration: BoxDecoration(
            color: AppColors.searchBar, // ensures consistent color!
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(imagePath),
              ),
              const SizedBox(height: 8),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Artist",
                style: TextStyle(color: Colors.white54),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
        // Cross icon at top-right
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {
              print("Cross tapped for $name");
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black45,
              ),
              padding: const EdgeInsets.all(2),
              child: const Icon(Icons.close, size: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

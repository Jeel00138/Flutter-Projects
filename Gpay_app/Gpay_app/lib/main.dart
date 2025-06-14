import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GPayHomePage(),
    );
  }
}


class FullImageScreen extends StatelessWidget {
  final String imagePath;

  const FullImageScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Hero(
            tag: 'profilePic',
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class GPayHomePage extends StatefulWidget {
  @override
  _GPayHomePageState createState() => _GPayHomePageState();
}

class _GPayHomePageState extends State<GPayHomePage> {
  bool showAllFavorites = false;
  bool showMoreIcons = false;
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> allFavorites = [
    {'letter': 'A', 'name': 'Ajay', 'color': Colors.pink},
    {'letter': 'M', 'name': 'Milkman', 'color': Colors.purple},
    {'letter': 'P', 'name': 'Prathap', 'color': Colors.red},
    {'letter': 'A', 'name': 'AM Market', 'color': Colors.green},
    {'letter': 'K', 'name': 'Karthik', 'color': Colors.brown},
    {'letter': 'A', 'name': 'Airtel', 'color': Colors.redAccent},
    {'letter': 'T', 'name': 'Tata Sky', 'color': Colors.blue},
    {'letter': 'K', 'name': 'Kirtan', 'color': Colors.brown},
    {'letter': 'A', 'name': 'Amisha', 'color': Colors.purple},
    {'letter': '', 'name': 'Show all', 'color': Colors.grey, 'icon': Icons.expand_more},

  ];

  List<Map<String, dynamic>> allFavorite = [
    {'letter': 'A', 'name': 'Ajay', 'color': Colors.pink},
    {'letter': 'M', 'name': 'Milkman', 'color': Colors.purple},
    /*{'letter': 'P', 'name': 'Prathap', 'color': Colors.red},
    {'letter': 'A', 'name': 'AM Market', 'color': Colors.green},
    {'letter': 'K', 'name': 'Karthik', 'color': Colors.brown},
    {'letter': 'A', 'name': 'Airtel', 'color': Colors.redAccent},
    {'letter': 'T', 'name': 'Tata Sky', 'color': Colors.blue},*/
    {'letter': '', 'name': 'Show less', 'color': Colors.grey, 'icon': Icons.expand_more},
  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    String searchQuery = searchController.text.toLowerCase();

    List<Map<String, dynamic>> filteredFavorites = allFavorites
        .where((fav) => fav['name'].toLowerCase().contains(searchQuery))
        .toList();

   List<Map<String, dynamic>> filteredFavorite = allFavorite
        .where((fav) => fav['name'].toLowerCase().contains(searchQuery))
        .toList();

    List<Map<String, dynamic>> displayedFavorites = List.from(filteredFavorites);
    List<Map<String, dynamic>> displayedFavorite = List.from(filteredFavorite);
    if (!showAllFavorites) {
      displayedFavorites = displayedFavorites.take(7).toList();

      displayedFavorites.add({
        'letter': '',
        'name': 'Show all',
        'color': Colors.grey,
        'icon': Icons.expand_more,
      });
    } else
{
      displayedFavorites = displayedFavorites.take(9).toList();
      displayedFavorites.add({

       'letter': '',
        'name': 'Show less',
        'color': Colors.grey,
        'icon': Icons.expand_less,
      });
    }


    return Scaffold(
      backgroundColor: Colors.blue[700],
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            // Top row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.emoji_events, color: Colors.white),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: 'G',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            foreground: Paint()
                              ..shader = LinearGradient(
                                colors: [Colors.red, Colors.green, Colors.blue, Colors.yellow],
                              ).createShader(Rect.fromLTWH(0.0,0.0, 200,70)),
                          ),
                        ),
                        TextSpan(text: 'Pay', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),

                  GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullImageScreen(imagePath: 'assets/pro3.jpg'),
                  ),
                );
              },
              child: Hero(
                tag: 'profilePic',
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/pro3.jpg'),
                  radius: 24,
                ),
              ),
            ),
                ],
              ),
            ),

            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: searchController,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: "Search contacts",
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Top 3 Icons
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 30,
              runSpacing: 20,
              children: [
                _buildIconButton(Icons.account_balance_outlined, "Bank Transfer"),
                _buildIconButton(Icons.qr_code, "Scan QR"),
                _buildIconButton(Icons.phone_outlined, "Phone Number"),
              ],
            ),

            SizedBox(height: 10),

            // Drop down arrow below top 3 icons
            GestureDetector(
              onTap: () {
                setState(() {
                  showMoreIcons = !showMoreIcons;
                });
              },
              child: Icon(
                showMoreIcons ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 30,
              ),
            ),

            // Hidden icons revealed after dropdown
            if (showMoreIcons) ...[
              SizedBox(height: 10),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 30,
                runSpacing: 20,
                children: [
                  _buildIconButton(Icons.account_balance_wallet, "Get Balance"),
                  _buildIconButton(Icons.phone_android, "Mobile Recharge"),
                  _buildIconButton(Icons.receipt_long, "Bill Payment"),
                ],
              ),
            ],


            SizedBox(height: 20),

            // White bottom section
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  children: [
                    // Scrollable part
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Favorites", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 12),
                            GridView.count(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              children: displayedFavorites.map((fav) {
                                return GestureDetector(
                                  onTap: () {
                                    if (fav['name'] == 'Show all' || fav['name'] == 'Show less') {
                                      setState(() {
                                        showAllFavorites = !showAllFavorites;
                                      });
                                    }
                                  },
                                  child: _buildFavorite(
                                    fav['letter'],
                                    fav['name'],
                                    fav['color'],
                                    icon: fav['icon'],
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Fixed bottom row
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0), // Optional: space from bottom
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildBottomIcon(Icons.emoji_events, "Rewards", Colors.orange),
                          _buildBottomIcon(Icons.local_offer, "Offers", Colors.pink),
                          _buildBottomIcon(Icons.group_add, "Referrals", Colors.blue),
                          _buildBottomIcon(Icons.pie_chart, "Spend Report", Colors.purple),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )


          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 28,
          child: Icon(icon, color: Colors.blue[700]),
        ),
        SizedBox(height: 6),
        Text(label, style: TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }

  Widget _buildFavorite(String letter, String name, Color color, {IconData? icon}) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: icon != null
              ? Icon(icon, color: Colors.white)
              : Text(letter, style: TextStyle(color: Colors.white)),
        ),
        SizedBox(height: 4),
        Text(name, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildBottomIcon(IconData icon, String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}

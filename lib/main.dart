import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cr⁷ Gamers',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFF0F0F1E),
      ),
      home: const MainHomeScreen(),
    );
  }
}

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const FreeFireTopUpScreen(),
    const TournamentScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🔥 Cr⁷ Gamers 🔥'),
        centerTitle: true,
        backgroundColor: const Color(0xFF1F1D2B),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amberAccent,
        unselectedItemColor: Colors.white60,
        backgroundColor: const Color(0xFF1F1D2B),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.diamond),
            label: 'FF Top-Up',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Tournament',
          ),
        ],
      ),
    );
  }
}

// ---------------- FREE FIRE TOP-UP SCREEN ----------------
class FreeFireTopUpScreen extends StatefulWidget {
  const FreeFireTopUpScreen({super.key});

  @override
  State<FreeFireTopUpScreen> createState() => _FreeFireTopUpScreenState();
}

class _FreeFireTopUpScreenState extends State<FreeFireTopUpScreen> {
  final TextEditingController _uidController = TextEditingController();
  String? _selectedPackage;
  String? _selectedPrice;

  // Complete Price List from User
  final List<Map<String, String>> _diamondPackages = [
    // Diamonds
    {'diamonds': '50 💎 Diamond', 'price': 'Rs 49'},
    {'diamonds': '115 💎 Diamond', 'price': 'Rs 110'},
    {'diamonds': '610 💎 Diamond', 'price': 'Rs 560'},
    {'diamonds': '1090 💎 Diamond', 'price': 'Rs 995'},
    {'diamonds': '1240 💎 Diamond', 'price': 'Rs 1095'},
    {'diamonds': '1595 💎 Diamond', 'price': 'Rs 1420'},
    {'diamonds': '2090 💎 Diamond', 'price': 'Rs 1850'},
    {'diamonds': '2530 💎 Diamond', 'price': 'Rs 2220'},
    {'diamonds': '5060 💎 Diamond', 'price': 'Rs 4460'},
    {'diamonds': '10120 💎 Diamond', 'price': 'Rs 9020'},

    // Memberships & Passes
    {'diamonds': 'Weekly 💎', 'price': 'Rs 220'},
    {'diamonds': 'Weekly 2x 💎', 'price': 'Rs 470'},
    {'diamonds': 'Weekly 3x 💎', 'price': 'Rs 675'},
    {'diamonds': 'Weekly 4x 💎', 'price': 'Rs 890'},
    {'diamonds': 'Weekly 5x 💎', 'price': 'Rs 1090'},
    {'diamonds': 'Weekly Lite 💎', 'price': 'Rs 90'},
    {'diamonds': 'Weekly Lite 2x 💎', 'price': 'Rs 160'},
    {'diamonds': 'Weekly Lite 3x 💎', 'price': 'Rs 240'},
    {'diamonds': 'Weekly Lite 4x 💎', 'price': 'Rs 290'},
    {'diamonds': 'Weekly Lite 5x 💎', 'price': 'Rs 375'},

    {'diamonds': 'Monthly 💎', 'price': 'Rs 1080'},
    {'diamonds': 'Monthly 2x 💎', 'price': 'Rs 2180'},
    {'diamonds': 'Monthly 3x 💎', 'price': 'Rs 3199'},

    {'diamonds': 'Level Up 25 💎', 'price': 'Rs 115'},
    {'diamonds': 'Level Up 30 💎', 'price': 'Rs 170'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner / Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.deepOrange, Colors.purpleDark],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              children: [
                Text(
                  '💎 Cr⁷ Gamers Top-Up 💎',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 6),
                Text(
                  'Trusted and fastest service 💯',
                  style: TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Player UID Input Box
          const Text(
            '1. Enter Free Fire Player UID:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.amberAccent),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _uidController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Example: 123456789',
              prefixIcon: const Icon(Icons.person, color: Colors.amberAccent),
              filled: true,
              fillColor: const Color(0xFF252836),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Select Diamond Package List
          const Text(
            '2. Select Diamond / Pass Pack:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.amberAccent),
          ),
          const SizedBox(height: 10),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGrid

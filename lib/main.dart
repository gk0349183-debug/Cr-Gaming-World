import 'package:flutter/material.dart';

void main() {
  runApp(const Cr7GamingWorldApp());
}

class Cr7GamingWorldApp extends StatelessWidget {
  const Cr7GamingWorldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cr⁷ Gaming World',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F0C20),
        primaryColor: const Color(0xFF7C3AED),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF161233),
          elevation: 0,
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const StoreScreen(),
    const GameScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF8B5CF6),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Quick Action - Cr⁷ Gaming World')),
          );
        },
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: const Color(0xFF161233),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_outlined, Icons.home, 'Home', 0),
            _buildNavItem(Icons.storefront_outlined, Icons.storefront, 'Top-Up', 1),
            const SizedBox(width: 40),
            _buildNavItem(Icons.sports_esports_outlined, Icons.sports_esports, 'Matches', 2),
            _buildNavItem(Icons.person_outline, Icons.person, 'Account', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData unselectedIcon, IconData selectedIcon, String label, int index) {
    final isSelected = _currentIndex == index;
    return InkWell(
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected ? selectedIcon : unselectedIcon,
            color: isSelected ? const Color(0xFFA78BFA) : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: isSelected ? const Color(0xFFA78BFA) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- 1. HOME SCREEN ----------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: _buildCustomAppBar('Cr⁷ Gaming World', 100),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Banner Box
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF4C1D95), Color(0xFF7C3AED)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome to Cr⁷ Gaming World 🎮',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(height: 6),
                        const Text('Trusted and Fastest Service 💯', style: TextStyle(fontSize: 12, color: Colors.amberAccent, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {},
                          child: const Text('TOP UP DIAMONDS', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  const Icon(Icons.diamond, size: 65, color: Colors.cyanAccent),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Quick Access Grid
            const Text('Quick Access', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.amber)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildQuickButton(Icons.sports_esports, 'Tournaments'),
                _buildQuickButton(Icons.receipt_long, 'My Orders'),
                _buildQuickButton(Icons.account_balance_wallet, 'Wallet'),
                _buildQuickButton(Icons.add_card, 'Load Money'),
              ],
            ),
            const SizedBox(height: 20),

            // Tournaments Section
            const Text("Live Matches & Tournaments", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.amber)),
            const SizedBox(height: 10),
            _buildMatchCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickButton(IconData icon, String title) {
    return Container(
      width: 75,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF161233),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2E235C)),
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFFA78BFA), size: 24),
          const SizedBox(height: 6),
          Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _buildMatchCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF161233),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF2E235C)),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(color: Colors.deepOrange, borderRadius: BorderRadius.circular(8)),
            child: const Icon(Icons.local_fire_department, size: 30, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('FREE FIRE SOLO SURVIVAL', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                SizedBox(height: 4),
                Text('Prize: Rs. 1000 | Entry: Rs. 30', style: TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- 2. TOP-UP STORE SCREEN ----------------
class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  final List<Map<String, String>> diamondPacks = const [
    {'item': '50 💎 Diamond', 'price': 'Rs 49'},
    {'item': '115 💎 Diamond', 'price': 'Rs 110'},
    {'item': '610 💎 Diamond', 'price': 'Rs 560'},
    {'item': '1090 💎 Diamond', 'price': 'Rs 995'},
    {'item': '1240 💎 Diamond', 'price': 'Rs 1095'},
    {'item': '1595 💎 Diamond', 'price': 'Rs 1420'},
    {'item': '2090 💎 Diamond', 'price': 'Rs 1850'},
    {'item': '2530 💎 Diamond', 'price': 'Rs 2220'},
    {'item': '5060 💎 Diamond', 'price': 'Rs 4460'},
    {'item': '10120 💎 Diamond', 'price': 'Rs 9020'},
  ];

  final List<Map<String, String>> membershipPacks = const [
    {'item': 'Weekly 💎', 'price': 'Rs 220'},
    {'item': 'Weekly 2x 💎', 'price': 'Rs 470'},
    {'item': 'Weekly 3x 💎', 'price': 'Rs 675'},
    {'item': 'Weekly 4x 💎', 'price': 'Rs 890'},
    {'item': 'Weekly 5x 💎', 'price': 'Rs 1090'},
    {'item': 'Monthly 💎', 'price': 'Rs 1080'},
    {'item': 'Monthly 2x 💎', 'price': 'Rs 2180'},
    {'item': 'Monthly 3x 💎', 'price': 'Rs 3199'},
    {'item': 'Weekly Lite 💎', 'price': 'Rs 90'},
    {'item': 'Weekly Lite 2x 💎', 'price': 'Rs 160'},
    {'item': 'Weekly Lite 3x 💎', 'price': 'Rs 240'},
    {'item': 'Weekly Lite 4x 💎', 'price': 'Rs 290'},
    {'item': 'Weekly Lite 5x 💎', 'price': 'Rs 375'},
    {'item': 'Level Up 25 💎', 'price': 'Rs 115'},
    {'item': 'Level Up 30 💎', 'price': 'Rs 170'},
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cr⁷ Top-Up Store 💎', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          bottom: const TabBar(
            indicatorColor: Colors.amber,
            tabs: [
              Tab(text: '💎 Diamonds'),
              Tab(text: '🎟️ Membership & Passes'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildGridList(context, diamondPacks),
            _buildGridList(context, membershipPacks),
          ],
        ),
      ),
    );
  }

  Widget _buildGridList(BuildContext context, List<Map<String, String>> items) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (ctx, index) {
        final pack = items[index];
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF161233),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF2E235C)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(pack['item']!, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.cyanAccent)),
              const SizedBox(height: 6),
              Text(pack['price']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.amber)),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 30,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7C3AED),
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () => _showBuyDialog(context, pack['item']!, pack['price']!),
                  child: const Text('BUY NOW', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showBuyDialog(BuildContext context, String title, String price) {
    final uidController = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF161233),
        title: Text('Buy $title', style: const TextStyle(color: Colors.amber)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Price: $price', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 12),
            TextField(
              controller: uidController,
              decoration: const InputDecoration(
                hintText: 'Enter Free Fire Player UID',
                filled: true,
                fillColor: Color(0xFF0F0C20),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Order placed for Player UID: ${uidController.text}')),
              );
            },
            child: const Text('Confirm Order', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}

// ---------------- 3. MATCHES SCREEN ----------------
class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: _buildCustomAppBar('Cr⁷ Gaming World', 100),
      ),
      body: const Center(
        child: Text('Tournament Matches Coming Soon!', style: TextStyle(color: Colors.grey)),
      ),
    );
  }
}

// ---------------- 4. ACCOUNT SCREEN ----------------
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: _buildCustomAppBar('Cr⁷ Gaming World', 100),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF161233),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Color(0xFF7C3AED),
                    child: Icon(Icons.person, size: 30, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Cr7 Gamer', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(height: 2),
                        Text('Trusted & Fastest Service 💯', style: TextStyle(fontSize: 11, color: Colors.amber)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Top Bar (AppBar with Logo & Points Counter)
Widget _buildCustomAppBar(String title, int points) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent, fontSize: 19),
    ),
    actions: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF2E235C),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const Icon(Icons.add_circle, color: Colors.blueAccent, size: 18),
            const SizedBox(width: 4),
            Text('$points Points', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(right: 12.0),
        child: Icon(Icons.notifications_none, color: Colors.white),
      )
    ],
  );
}

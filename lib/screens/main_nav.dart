import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_screen.dart';

class MainNav extends StatefulWidget {
  const MainNav({super.key});

  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const AddIngredientScreen(),
    const IngredientsRegisteredScreen(),
    const DietInsightsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: Stack(
        children: [
          // Main content
          Positioned.fill(
            child: _screens[_selectedIndex],
          ),
          // Floating nav bar always on top
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: FloatingNavBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy screens for demonstration:
class AddIngredientScreen extends StatelessWidget {
  const AddIngredientScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Add Ingredient Screen'));
  }
}

class IngredientsRegisteredScreen extends StatelessWidget {
  const IngredientsRegisteredScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Ingredients Registered Screen'));
  }
}

class DietInsightsScreen extends StatelessWidget {
  const DietInsightsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Diet Insights Screen'));
  }
}

class FloatingNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const FloatingNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double navBarHeight = MediaQuery.of(context).size.height * 0.09;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Container(
          height: navBarHeight.clamp(64, 90),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha((0.95 * 255).round()),
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha((0.10 * 255).round()),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              selectedItemColor: Colors.deepPurple,
              unselectedItemColor: Colors.black54,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              currentIndex: currentIndex,
              onTap: onTap,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.circlePlus),
                  label: 'Add',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.clipboardList),
                  label: 'Plans',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.chartPie),
                  label: 'Stats',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
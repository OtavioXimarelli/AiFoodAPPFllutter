import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double cardRadius = 24;
    final double cardPadding = 20;
    final double sectionSpacing = 22;
    final double cardSpacing = 16;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.06,
            right: MediaQuery.of(context).size.width * 0.06,
            top: sectionSpacing + 6,
            bottom: 100, // enough space for nav bar shadow
          ),
          child: Column(
            children: [
              // Greeting Bar
              Material(
                elevation: 6,
                borderRadius: BorderRadius.circular(cardRadius),
                color: Colors.white,
                shadowColor: Colors.black26,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: cardPadding, vertical: 18),
                  child: Row(
                    children: [
                      Icon(Icons.restaurant_menu, color: Colors.deepPurple, size: 32),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Hello, Otavio ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.black87,
                                ),
                              ),
                              Text('👋', style: TextStyle(fontSize: 22)),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Ready to plan your next meal?',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: sectionSpacing),
              // Ingredients at Home (Top Card)
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(cardRadius),
                color: Colors.white,
                shadowColor: Colors.black12,
                child: Padding(
                  padding: EdgeInsets.all(cardPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ingredients at Home',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _ingredientRow(Icons.eco, Colors.deepPurple, 'Broccoli', '(2024-05-23)'),
                      const SizedBox(height: 8),
                      _ingredientRow(Icons.set_meal, Colors.deepPurple, 'Chicken', '(2024-05-25)'),
                      const SizedBox(height: 8),
                      _ingredientRow(Icons.rice_bowl, Colors.deepPurple, 'Rice', '(2024-06-01)'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: sectionSpacing + 4), // More space between sections
              // Meal Plan Preview (improved legibility, skinnier roll)
              SizedBox(
                height: 82, // Skinnier roll
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  children: [
                    _MealCard(title: "Chicken Salad", icon: Icons.set_meal, color: Colors.deepPurple),
                    _MealCard(title: "Veggie Bowl", icon: Icons.eco, color: Colors.green),
                    _MealCard(title: "Rice & Beans", icon: Icons.rice_bowl, color: Colors.orange),
                  ],
                ),
              ),
              SizedBox(height: cardSpacing + 2), // More space after roll
              // AI Recommendation
              _InfoCard(
                color: Colors.teal.shade50,
                icon: Icons.lightbulb,
                iconColor: Colors.teal,
                text: "AI Suggestion: Try a high-protein breakfast today for muscle growth!",
              ),
              SizedBox(height: cardSpacing),
              // Progress Overview
              _ProgressCard(),
              SizedBox(height: cardSpacing),
              // Motivational Quote
              _InfoCard(
                color: Colors.orange.shade50,
                icon: Icons.format_quote,
                iconColor: Colors.orange,
                text: "\"Success is the sum of small efforts, repeated day in and day out.\"",
                italic: true,
              ),
              SizedBox(height: cardSpacing),
              // Recent Activity
              _InfoCard(
                color: Colors.blueGrey.shade50,
                icon: Icons.history,
                iconColor: Colors.blueGrey,
                text: "Recent: Added Chicken, Updated Goal, Generated Meal Plan",
              ),
              SizedBox(height: sectionSpacing),
              // Goals (Bottom Card)
              Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(cardRadius),
                color: Colors.white,
                shadowColor: Colors.black38,
                child: Padding(
                  padding: EdgeInsets.all(cardPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.track_changes, color: Colors.deepPurple, size: 26),
                              const SizedBox(width: 8),
                              Text(
                                'Goals',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '+ Edit',
                            style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.only(left: 32),
                        child: Text(
                          'Eat Healthy, Build Muscle',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60), // <--- Add this line!
            ],
          ),
        ),
      ),
    );
  }

  Widget _ingredientRow(IconData icon, Color iconColor, String name, String date) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 24),
        const SizedBox(width: 10),
        Text(name, style: TextStyle(fontSize: 16)),
        const SizedBox(width: 10),
        Text(
          date,
          style: TextStyle(color: Colors.teal, fontSize: 16),
        ),
      ],
    );
  }
}

class _MealCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  const _MealCard({required this.title, required this.icon, required this.color});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, // White for best contrast
      shadowColor: color.withAlpha((0.25 * 255).toInt()),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2), // More space between cards
      elevation: 6, // More shadow for floating effect
      child: Container(
        width: 98, // Skinnier card
        height: 62, // Shorter card
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 26, color: color), // Smaller icon
            const SizedBox(height: 6),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: Colors.black87,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Color iconColor;
  final String text;
  final bool italic;
  const _InfoCard({
    required this.color,
    required this.icon,
    required this.iconColor,
    required this.text,
    this.italic = false,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 30),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: italic ? FontStyle.italic : FontStyle.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.show_chart, color: Colors.deepPurple, size: 30),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Weekly Progress", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: 0.6,
                    backgroundColor: Colors.deepPurple.withAlpha(30),
                    color: Colors.teal,
                  ),
                  const SizedBox(height: 4),
                  Text("60% of your weekly nutrition goal reached", style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
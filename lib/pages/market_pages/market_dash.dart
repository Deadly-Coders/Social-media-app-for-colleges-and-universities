import 'package:flutter/material.dart';
import 'package:social_flutter/app_bar.dart';
import 'package:social_flutter/commonnav.dart';
import 'package:social_flutter/drawer.dart';
import 'package:social_flutter/pages/market_pages/market1.dart';
import 'package:social_flutter/pages/market_pages/market3.dart';
import 'package:social_flutter/pages/market_pages/market4.dart';

class MarketDash extends StatelessWidget {
  const MarketDash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      drawer: const AppDrawer(),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Market Options',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          MarketOption(
            icon: Icons.add,
            title: 'Create Market',
            description: 'Start a new market from scratch',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Market1()),
              );
            },
          ),
          // Navigate to Your Market page
          MarketOption(
            icon: Icons.person,
            title: 'Your Market',
            description: 'View and manage your markets',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Market3(
                          title: '',
                        )),
              );
            },
          ),
          // Navigate to Global Market page
          MarketOption(
            icon: Icons.public,
            title: 'Global Market',
            description: 'Explore global market trends',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Market4()),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

class MarketOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const MarketOption({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(description),
        onTap: onTap, // Trigger the navigation when tapped
      ),
    );
  }
}

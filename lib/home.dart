import 'package:flutter/material.dart';
import 'package:social_flutter/app_bar.dart';
import 'package:social_flutter/commonnav.dart';
import 'package:social_flutter/drawer.dart';
import 'package:social_flutter/suggested_friends_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class UniConnectApp extends StatefulWidget {
  const UniConnectApp({super.key});

  @override
  State<UniConnectApp> createState() => _UniConnectAppState();
}

class _UniConnectAppState extends State<UniConnectApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for friends, events, resources...',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.mic),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Suggested People',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  SuggestedFriendsSection(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Upcoming Events',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildEventCard(
                          'HackCelestial | Pillai',
                          'Join the annual hackathon',
                          'assets/images/hackcelestial.png',
                          onPressed: () async {
                            const url = 'http://tech.alegria.co.in/hackathon';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: _buildEventCard(
                          'SIH 2024',
                          'Government of...',
                          'assets/images/sih.png',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Trending Topics',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildTopicCard(
                          'Study Tips',
                          'Best study practices',
                          'assets/images/study tips.png',
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: _buildTopicCard(
                          'Campus News',
                          'Latest campus updates',
                          'assets/images/campus news.jpeg',
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildTopicCard(
                          'Sports',
                          'Sports news and updates',
                          'assets/images/sports.jpeg',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }

  Widget _buildEventCard(
    String title,
    String description,
    String imagePath, {
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopicCard(
    String title,
    String description,
    String imagePath, {
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

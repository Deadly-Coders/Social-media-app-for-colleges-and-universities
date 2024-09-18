import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'University Communities',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UniversityCommunitiesPage(),
    );
  }
}

class UniversityCommunitiesPage extends StatelessWidget {
  const UniversityCommunitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('University Communities'),
        backgroundColor: Colors.blue, // Customize the color as needed
        elevation: 0, // Remove the shadow
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {}, // Handle back button press
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {}, // Handle search action
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search communities, events, and more',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Popular Communities',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                _CommunityTile(
                  imagePath: 'assets/harvard.jpg', // Replace with actual image paths
                  title: 'Harvard University',
                  description: 'Join the Harvard community to connect with...',
                ),
                _CommunityTile(
                  imagePath: 'assets/stanford.jpg',
                  title: 'Stanford University',
                  description: 'Explore the Stanford community for events...',
                ),
                _CommunityTile(
                  imagePath: 'assets/mit.jpg',
                  title: 'MIT',
                  description: 'Be a part of the MIT community and engage...',
                ),
                _CommunityTile(
                  imagePath: 'assets/oxford.jpg',
                  title: 'University of Oxford',
                  description: 'Connect with the University of Oxford...',
                ),
                _CommunityTile(
                  imagePath: 'assets/cambridge.jpg',
                  title: 'University of Cambridge',
                  description: 'Join the University of Cambridge community...',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Set the current index to highlight the "Home" icon
        onTap: (index) {}, // Handle navigation to different sections
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _CommunityTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const _CommunityTile({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        leading: Image.asset(imagePath),
        title: Text(title),
        subtitle: Text(description),
        onTap: () {}, // Handle community tile tap
      ),
    );
  }
}
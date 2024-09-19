import 'package:flutter/material.dart';

class Communities2 extends StatefulWidget {
  const Communities2({super.key});

  @override
  State<Communities2> createState() => _Communities2State();
}

class _Communities2State extends State<Communities2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('University Communities'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Handle back button press
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.mic),
            onPressed: () {
              // Handle mic button press
            },
          ),
          IconButton(
            icon: Icon(Icons.signal_cellular_4_bar),
            onPressed: () {
              // Handle signal button press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search communities...',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Handle "Join University Community" button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text('Join University Community'),
                  ),
                ],
              ),
            ),
            // Add the "Harvard" image with the shield
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Image.asset(
                  'assets/harvard_image.png'), // Replace with your actual image path
            ),
            // Add "New & Trending Communities" title
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'New & Trending Communities',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Add community cards
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: CommunityCard(
                      title: 'Harvard Debate Club',
                      icon: Icons.school,
                      imagePath: 'assets/debate_club.png',
                      onPressed: () {
                        // Handle "Harvard Debate Club" card press
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: CommunityCard(
                      title: 'Harvard Robotics Team',
                      icon: Icons.android,
                      imagePath: 'assets/robotics_team.png',
                      onPressed: () {
                        // Handle "Harvard Robotics Team" card press
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Add "Recommended for You" title
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Recommended for You',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Add recommended community card
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: CommunityCard(
                title: 'Photography Club',
                icon: Icons.camera_alt,
                imagePath: 'assets/photography_club.png',
                onPressed: () {
                  // Handle "Photography Club" card press
                },
              ),
            ),
            // Add AR and Video options
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Explore',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to AR functionality
                      },
                      child: Text('AR Experience'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 20),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to Video functionality
                      },
                      child: Text('Video Tours'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Add "Popular in Your University" title
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Popular in Your University',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Add university community cards
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: UniversityCommunityCard(
                      title: 'Harvard Business Review',
                      members: 500,
                      imagePath: 'assets/business_review.png',
                      onPressed: () {
                        // Handle "Harvard Business Review" card press
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: UniversityCommunityCard(
                      title: 'Harvard Law Society',
                      members: 300,
                      imagePath: 'assets/law_society.png',
                      onPressed: () {
                        // Handle "Harvard Law Society" card press
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: UniversityCommunityCard(
                      title: 'Harvard Medical Forum',
                      members: 450,
                      imagePath: 'assets/medical_forum.png',
                      onPressed: () {
                        // Handle "Harvard Medical Forum" card press
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Add bottom navigation bar
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              child: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.people),
                    label: 'Communities',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.message),
                    label: 'Messages',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
                onTap: (index) {
                  // Handle bottom navigation bar item press
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommunityCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String imagePath;
  final VoidCallback onPressed;

  CommunityCard({
    required this.title,
    required this.icon,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(icon, size: 30),
                  SizedBox(width: 16),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(imagePath, height: 100, fit: BoxFit.cover),
            Container(
              padding: EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  // Handle "Join" button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text('Join'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UniversityCommunityCard extends StatelessWidget {
  final String title;
  final int members;
  final String imagePath;
  final VoidCallback onPressed;

  UniversityCommunityCard({
    required this.title,
    required this.members,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image.asset(imagePath, height: 100, fit: BoxFit.cover),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                '$members members',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

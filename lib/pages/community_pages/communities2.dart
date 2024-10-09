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
        title: const Text('University Communities'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Handle back button press
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.mic),
            onPressed: () {
              // Handle mic button press
            },
          ),
          IconButton(
            icon: const Icon(Icons.signal_cellular_4_bar),
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
              margin: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search communities...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Handle "Join University Community" button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text('Join University Community'),
                  ),
                ],
              ),
            ),
            // Add the "Harvard" image with the shield
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Image.asset(
                  'assets/harvard_image.png'), // Replace with your actual image path
            ),
            // Add "New & Trending Communities" title
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: const Text(
                'New & Trending Communities',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Add community cards
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
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
                  const SizedBox(width: 16),
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
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: const Text(
                'Recommended for You',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Add recommended community card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
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
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: const Text(
                'Explore',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to AR functionality
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                      ),
                      child: const Text('AR Experience'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to Video functionality
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                      ),
                      child: const Text('Video Tours'),
                    ),
                  ),
                ],
              ),
            ),
            // Add "Popular in Your University" title
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: const Text(
                'Popular in Your University',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Add university community cards
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
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
                  const SizedBox(width: 16),
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
                  const SizedBox(width: 16),
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
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: BottomNavigationBar(
                items: const [
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

  const CommunityCard({super.key, 
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
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(icon, size: 30),
                  const SizedBox(width: 16),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(imagePath, height: 100, fit: BoxFit.cover),
            Container(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  // Handle "Join" button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text('Join'),
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

  const UniversityCommunityCard({super.key, 
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
              padding: const EdgeInsets.all(16),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image.asset(imagePath, height: 100, fit: BoxFit.cover),
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                '$members members',
                style: const TextStyle(
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

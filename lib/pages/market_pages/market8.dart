import 'package:flutter/material.dart';

class Market8 extends StatelessWidget {
  const Market8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Freelance Logo Design'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              SizedBox(
                height: 200,
                child: Image.asset(
                    'assets/logo_design_image.png'), // Replace with your image path
              ),
              const SizedBox(height: 16),
              // Title
              const Text(
                'Top Freelance Logo Design Opportunities',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Description
              const Text(
                'Are you a talented logo designer looking for freelance opportunities? Look no further! Our platform connects you with clients from around the world who are in need of unique and...',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              // Project Details
              const Text(
                'Project Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildProjectDetailRow('Project Name', 'Tech'),
              _buildProjectDetailRow('Client', 'John'),
              _buildProjectDetailRow('Budget', '\$500'),
              _buildProjectDetailRow(
                  'Deadline', 'Oct 15, 2023'), // Replace with actual date
              _buildProjectDetailRow('Style', 'Modern'),
              _buildProjectDetailRow('Tools Required', 'Adobe'),
              _buildProjectDetailRow('Experience Level', 'Intermediate'),
              const SizedBox(height: 32),
              // Apply Now Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button press (e.g., navigate to application page)
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('Apply Now'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(Icons.work),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildProjectDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

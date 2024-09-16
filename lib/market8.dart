import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freelance Logo Design App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FreelanceLogoDesignPage(),
    );
  }
}

class FreelanceLogoDesignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Freelance Logo Design'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              Container(
                height: 200,
                child: Image.asset('assets/logo_design_image.png'), // Replace with your image path
              ),
              SizedBox(height: 16),
              // Title
              Text(
                'Top Freelance Logo Design Opportunities',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              // Description
              Text(
                'Are you a talented logo designer looking for freelance opportunities? Look no further! Our platform connects you with clients from around the world who are in need of unique and...',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              // Project Details
              Text(
                'Project Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildProjectDetailRow('Project Name', 'Tech'),
              _buildProjectDetailRow('Client', 'John'),
              _buildProjectDetailRow('Budget', '\$500'),
              _buildProjectDetailRow('Deadline', 'Oct 15, 2023'), // Replace with actual date
              _buildProjectDetailRow('Style', 'Modern'),
              _buildProjectDetailRow('Tools Required', 'Adobe'),
              _buildProjectDetailRow('Experience Level', 'Intermediate'),
              SizedBox(height: 32),
              // Apply Now Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button press (e.g., navigate to application page)
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text('Apply Now'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
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
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
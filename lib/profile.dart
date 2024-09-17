import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key = const Key('MyHomePage'), required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search for careers',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Blank_portrait_placeholder.png/640px-Blank_portrait_placeholder.png'),
                    radius: 30,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Smith',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '@johnsmith',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Experienced software engineer with a passion for developing innovative programs that expedite the efficiency and effectiveness of organizational success...',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('1.2K Followers'),
                  Text('300 Following'),
                  Text('45 Posts'),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Follow'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Professional Achievements',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Over the past decade, I have successfully led multiple projects from conception to completion, including the development of a new customer relationship management system that increased...',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),
              Text(
                'Career Options',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildCareerOption(
                icon: Icons.code,
                title: 'Software Engineer',
                description: 'Develops and maintains software...',
              ),
              _buildCareerOption(
                icon: Icons.analytics,
                title: 'Data Scientist',
                description: 'Analyzes complex data to help make...',
              ),
              _buildCareerOption(
                icon: Icons.list_alt,
                title: 'Product Manager',
                description: 'Oversees the development and delivery...',
              ),
              _buildCareerOption(
                icon: Icons.design_services,
                title: 'UX Designer',
                description: 'Designs user-friendly interfaces for...',
              ),
              _buildCareerOption(
                icon: Icons.campaign,
                title: 'Marketing Specialist',
                description: 'Creates marketing strategies to promote...',
              ),
              _buildCareerOption(
                icon: Icons.account_balance,
                title: 'Sales Executive',
                description: 'Manages client relationships and sales...',
              ),
              SizedBox(height: 16),
              Text(
                'Skills & Endorsements',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Proficient in Java, Python, and C++. Experienced in Agile methodologies and project management. Strong problem-solving skills and ability to work under pressure. Excellent communication and...',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text('Add Achievement'),
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
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildCareerOption({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(description),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
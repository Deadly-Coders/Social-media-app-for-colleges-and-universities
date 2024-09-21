import 'package:flutter/material.dart';

class Career1 extends StatefulWidget {
  const Career1({super.key});

  @override
  State<Career1> createState() => _Career1State();
}

class _Career1State extends State<Career1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Career Options'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search career options...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),

            // Filter Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Location'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Industry'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Experience Level'),
                  ),
                ],
              ),
            ),

            // Career Options Section
            const Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  // Software Engineer Card
                  CareerCard(
                    imagePath: 'assets/images/software engineer.jpeg',
                    title: 'Software Engineer',
                    company: 'Google',
                  ),
                  SizedBox(height: 16.0),

                  // Marketing Manager Card
                  CareerCard(
                    imagePath: 'assets/images/marketing manager.jpeg',
                    title: 'Marketing Manager',
                    company: 'Apple',
                  ),
                  SizedBox(height: 16.0),

                  // Data Scientist Card
                  CareerCard(
                    imagePath: 'assets/images/amazon.png',
                    title: 'Data Scientist',
                    company: 'Amazon',
                  ),
                ],
              ),
            ),

            // Recommended for You Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Recommended for You',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),

                  // UX Designer Card
                  RecommendedCard(
                    imagePath: 'assets/images/facebook.jpeg',
                    title: 'UX Designer',
                    company: 'Facebook',
                  ),
                  SizedBox(height: 16.0),

                  // Product Manager Card
                  RecommendedCard(
                    imagePath: 'assets/iamges/apple.png',
                    title: 'Product Manager',
                    company: 'Microsoft',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: 'Connect',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class CareerCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String company;

  const CareerCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "Career2");
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Image.asset(imagePath, height: 100.0, width: 100.0),
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    company,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendedCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String company;

  const RecommendedCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "Career2");
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Image.asset(imagePath, height: 60.0, width: 60.0),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    company,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

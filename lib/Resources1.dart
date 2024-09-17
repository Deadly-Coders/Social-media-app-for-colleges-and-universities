import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('Resources'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
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
              Text(
                'Resources',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('UT PYQS'),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Semester PYQS'),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Textbook PDFs'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for study materials',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.mic),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Lecture Notes'),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Research Papers'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text('Case Studies'),
              ),
              SizedBox(height: 16),
              Text(
                'Research Papers & Case Studies',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Card(
                child: ListTile(
                  leading: Image.asset('assets/case_study_image.png'),
                  title: Text('The Impact of Climate...'),
                  subtitle: Text('John Doe, 2021'),
                ),
              ),
              SizedBox(height: 16),
              Card(
                child: ListTile(
                  leading: Image.asset('assets/case_study_image2.png'),
                  title: Text('Case Study: Tesla\'s Mark...'),
                  subtitle: Text('Jane Smith, 2020'),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Online Resource Links',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Card(
                child: ListTile(
                  leading: Image.asset('assets/khan_academy_logo.png'),
                  title: Text('Khan Academy'),
                  trailing: Icon(Icons.open_in_new),
                  onTap: () {},
                ),
              ),
              SizedBox(height: 16),
              Card(
                child: ListTile(
                  leading: Image.asset('assets/coursera_logo.png'),
                  title: Text('Coursera'),
                  trailing: Icon(Icons.language),
                  onTap: () {},
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Flashcards',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Card(
                child: ListTile(
                  leading: Image.asset('assets/biology_flashcard.png'),
                  title: Text('Biology Basics'),
                  subtitle: Text('Study the basics of biology'),
                ),
              ),
              SizedBox(height: 16),
              Card(
                child: ListTile(
                  leading: Image.asset('assets/physics_flashcard.png'),
                  title: Text('Physics Formulas'),
                  subtitle: Text('Key formulas in physics'),
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
            icon: Icon(Icons.book),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Courses',
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
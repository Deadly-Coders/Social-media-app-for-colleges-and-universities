import 'package:flutter/material.dart';

class Resources1 extends StatefulWidget {
  const Resources1({super.key});

  @override
  State<Resources1> createState() => _Resources1State();
}

class _Resources1State extends State<Resources1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('Resources'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
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
              const Text(
                'Resources',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('UT PYQS'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Semester PYQS'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Textbook PDFs'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Search for study materials',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.mic),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Lecture Notes'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Research Papers'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Case Studies'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Research Papers & Case Studies',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: ListTile(
                  leading: Image.asset('assets/case_study_image.png'),
                  title: const Text('The Impact of Climate...'),
                  subtitle: const Text('John Doe, 2021'),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: ListTile(
                  leading: Image.asset('assets/case_study_image2.png'),
                  title: const Text('Case Study: Tesla\'s Mark...'),
                  subtitle: const Text('Jane Smith, 2020'),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Online Resource Links',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: ListTile(
                  leading: Image.asset('assets/khan_academy_logo.png'),
                  title: const Text('Khan Academy'),
                  trailing: const Icon(Icons.open_in_new),
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: ListTile(
                  leading: Image.asset('assets/coursera_logo.png'),
                  title: const Text('Coursera'),
                  trailing: const Icon(Icons.language),
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Flashcards',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: ListTile(
                  leading: Image.asset('assets/biology_flashcard.png'),
                  title: const Text('Biology Basics'),
                  subtitle: const Text('Study the basics of biology'),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: ListTile(
                  leading: Image.asset('assets/physics_flashcard.png'),
                  title: const Text('Physics Formulas'),
                  subtitle: const Text('Key formulas in physics'),
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

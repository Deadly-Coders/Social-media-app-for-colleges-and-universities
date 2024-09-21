import 'package:flutter/material.dart';

class Game1 extends StatefulWidget {
  final String title;
  const Game1({
    super.key,
    required this.title,
  });

  @override
  State<Game1> createState() => _Game1State();
}

class _Game1State extends State<Game1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Welcome back, Alex! Ready to level up your coding skills?',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            ..._buildChallenges(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildChallenges() {
    return [
      _buildChallenge(
        image: 'assets/images/error code.jpg',
        title: 'Find the Error in Code',
        description: 'Identify and fix errors in code...',
      ),
      _buildChallenge(
        image: 'assets/images/api code.jpeg',
        title: 'Create Code for a Given API',
        description: 'Write functional code based on API documentation...',
      ),
      _buildChallenge(
        image: 'assets/images/debugging.jpeg',
        title: 'Debugging Challenge',
        description: 'Fix multiple errors in a complex piece of code...',
      ),
      _buildChallenge(
        image: 'assets/images/code_puzzles.png',
        title: 'Code Puzzle',
        description: 'Solve algorithmic or logic-based puzzles using code...',
      ),
    ];
  }

  Widget _buildChallenge(
      {required String image,
      required String title,
      required String description}) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChallengeScreen(
                image: image,
                title: title,
                description: description,
              ),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 130,
                width: double.infinity,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                description,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChallengeScreen extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const ChallengeScreen({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double
                  .infinity, // Make the image take the full width of the screen
              child: Image.asset(
                image,
                fit: BoxFit.cover, // Adjusts the image to cover the width
              ),
            ),
            SizedBox(height: 16),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "Game2");
              },
              child: Text('Start Game'),
            ),
          ],
        ),
      ),
    );
  }
}

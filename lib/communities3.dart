import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ARCampusTour(),
    );
  }
}

class ARCampusTour extends StatefulWidget {
  @override
  _ARCampusTourState createState() => _ARCampusTourState();
}

class _ARCampusTourState extends State<ARCampusTour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AR Campus Tour'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Welcome to Your AR Campus Tour',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Experience our university campus like never before with our AR Campus Tour. Discover landmarks, learn about buildings, and interact with hotspots for more information. Navigate easily with our mini-map and...',
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Start'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Guide'),
                  ),
                ],
              ),
            ),
            Card(
              child: ListTile(
                leading: Image.asset('assets/mini_map.jpg'),
                title: Text('Interactive Mini-Map'),
                subtitle: Text('Navigate the campus with ease...'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Landmarks',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Discover key landmarks on campus with AR overlays. Tap on labels to learn more about each landmark, including its history and significance.',
                textAlign: TextAlign.justify,
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    CircularProgressIndicator(
                      value: 0.45,
                      strokeWidth: 10.0,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.blueAccent),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Tour Progress',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Track your progress as you explore the campus.',
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Image.asset('assets/virtual_guide.jpg'),
                title: Text('Meet Your Virtual Guide'),
                subtitle: Text('Choose from a variety of virtual guides or...'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Interactive Hotspots',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Tap on interactive hotspots around the campus to get detailed information about buildings, departments, and facilities. Learn about the services offered and the people who work there.',
                textAlign: TextAlign.justify,
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Capture Moments'),
                subtitle: Text('Take photos during your tour and share the...'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmarks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {},
      ),
    );
  }
}
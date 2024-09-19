import 'package:flutter/material.dart';

class Career4 extends StatefulWidget {
  const Career4({super.key});

  @override
  State<Career4> createState() => _Career4State();
}

class _Career4State extends State<Career4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('CareerHub'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Submission Confirmation',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Thank you for submitting your job or internship to CareerHub. Your submission is currently being reviewed. You can track the status of your submission in the \'Pending\' section. If approved, it...',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                child: Text('View Pending Submissions'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                child: Text('Submit Another Job/Internship'),
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {},
                child: Text('Contact Support'),
              ),
              SizedBox(height: 32.0),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/clipboard.png',
                        width: 50.0,
                        height: 50.0,
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Pending Submissions',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            'Pending',
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
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
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

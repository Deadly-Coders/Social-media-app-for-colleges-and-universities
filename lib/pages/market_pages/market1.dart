import 'package:flutter/material.dart';

void main() {
  runApp(const Market1());
}

class Market1 extends StatefulWidget {
  const Market1({super.key});

  @override
  State<Market1> createState() => _Market1State();
}

class _Market1State extends State<Market1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketplace',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Marketplace'),
        ),
        body: ListView(
          children: [
            // Search bar
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Search',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Buy & Sell Textbooks
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Buy & Sell Textbooks',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return const ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage('https://placehold.co/60x60'),
                        ),
                        title: Text('Biology Textbook'),
                        subtitle: Text('Virendra Warade'),
                        trailing: Text('\₹80'),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Buy & Sell Gadgets
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Buy & Sell Gadgets',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return const ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage('https://placehold.co/60x60'),
                        ),
                        title: Text('Gadget Name'),
                        subtitle: Text('Brand Name'),
                        trailing: Text('\$50'),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Dorm Essentials
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Dorm Essentials',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage('https://placehold.co/60x60'),
                        ),
                        title: Text('Essential Item'),
                        subtitle: Text('Brand Name'),
                        trailing: Text('\$10'),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Find a Tutor
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Find a Tutor',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage('https://placehold.co/60x60'),
                        ),
                        title: Text('John Doe'),
                        subtitle: Text('Subject'),
                        trailing: Text('\$30/hr'),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Freelance Opportunities
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Freelance Opportunities',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage('https://placehold.co/60x60'),
                        ),
                        title: Text('Graphic Design'),
                        subtitle: Text('Company Name'),
                        trailing: Text('\$500'),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Bottom navigation bar
            BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_circle),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: '',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

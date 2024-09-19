import 'package:flutter/material.dart';

class Freind1 extends StatefulWidget {
  const Freind1({super.key});

  @override
  State<Freind1> createState() => _Freind1State();
}

class _Freind1State extends State<Freind1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search friends or recommendat',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Friends'),
                Tab(text: 'Requests'),
                Tab(text: 'Suggestions'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  FriendsTab(),
                  RequestsTab(),
                  SuggestionsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(Icons.person),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
      ),
    );
  }
}

class FriendsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FriendItem(
          name: 'John Doe',
          subtitle: 'Lives in New York, NY',
          imageUrl: 'https://picsum.photos/200',
        ),
        FriendItem(
          name: 'Jane Smith',
          subtitle: 'Works at Google',
          imageUrl: 'https://picsum.photos/200',
        ),
        FriendItem(
          name: 'Michael Brown',
          subtitle: 'Studied at MIT',
          imageUrl: 'https://picsum.photos/200',
        ),
        FriendItem(
          name: 'Emily Davis',
          subtitle: 'Lives in San Francisco, CA',
          imageUrl: 'https://picsum.photos/200',
        ),
      ],
    );
  }
}

class FriendItem extends StatelessWidget {
  final String name;
  final String subtitle;
  final String imageUrl;

  const FriendItem({
    Key? key,
    required this.name,
    required this.subtitle,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(name),
      subtitle: Text(subtitle),
    );
  }
}

class RequestsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Requests'),
    );
  }
}

class SuggestionsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Suggestions'),
    );
  }
}

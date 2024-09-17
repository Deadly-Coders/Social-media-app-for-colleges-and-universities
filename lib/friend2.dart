import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friend Requests App',
      home: FriendRequestsScreen(),
    );
  }
}

class FriendRequestsScreen extends StatefulWidget {
  @override
  _FriendRequestsScreenState createState() => _FriendRequestsScreenState();
}

class _FriendRequestsScreenState extends State<FriendRequestsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friend Requests'),
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.notifications),
          SizedBox(width: 16),
          Icon(Icons.search),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Friend Requests',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FriendRequestItem(
              name: 'John Smith',
              username: '@johnsmith', // Make sure this is included!
              mutualFriends: 3,
              onPressed: () {},
            ),
            FriendRequestItem(
              name: 'Emily Johnson',
              username: '@emilyj', // Make sure this is included!
              mutualFriends: 5,
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Recently Added Friends',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FriendListItem(
              name: 'Michael Brown',
              username: '@mikebrown',
              isChat: true,
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Declined Requests',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FriendRequestItem(
              name: 'Sarah Wilson',
              username: '@sarahw', // Make sure this is included!
              isDeclined: true,
              onPressed: () {},
            ),
            FriendRequestItem(
              name: 'David Lee',
              username: '@davidlee', // Make sure this is included!
              isDeclined: true,
              onPressed: () {},
            ),
            FriendRequestItem(
              name: 'Sophia Martinez',
              username: '@sophia', // Make sure this is included!
              isDeclined: true,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class FriendRequestItem extends StatelessWidget {
  final String name;
  final String username; // Required parameter
  final int mutualFriends;
  final bool isDeclined;
  final VoidCallback onPressed;

  const FriendRequestItem({
    Key? key,
    required this.name,
    required this.username, // Make sure username is marked 'required'
    this.mutualFriends = 0,
    this.isDeclined = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          'https://picsum.photos/200/300', // Replace with actual image URL
        ),
      ),
      title: Text(
        '$name $username',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: isDeclined
          ? Text('Restore')
          : Text(
        '$mutualFriends mutual friends',
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      trailing: ElevatedButton(
        onPressed: onPressed,
        child: isDeclined
            ? Text('Restore')
            : Text(
          'Accept',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class FriendListItem extends StatelessWidget {
  final String name;
  final String username;
  final bool isChat;
  final VoidCallback onPressed;

  const FriendListItem({
    Key? key,
    required this.name,
    required this.username,
    this.isChat = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          'https://picsum.photos/200/300', // Replace with actual image URL
        ),
      ),
      title: Text(
        '$name $username',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: isChat
          ? Icon(Icons.chat_bubble_outline)
          : null,
      onTap: onPressed,
    );
  }
}
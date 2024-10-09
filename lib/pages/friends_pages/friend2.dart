import 'package:flutter/material.dart';

class Friend2 extends StatefulWidget {
  const Friend2({super.key});

  @override
  State<Friend2> createState() => _Friend2State();
}

class _Friend2State extends State<Friend2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friend Requests'),
        leading: const Icon(Icons.menu),
        actions: const [
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
            const Padding(
              padding: EdgeInsets.all(16.0),
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
            const Padding(
              padding: EdgeInsets.all(16.0),
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
            const Padding(
              padding: EdgeInsets.all(16.0),
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
    super.key,
    required this.name,
    required this.username, // Make sure username is marked 'required'
    this.mutualFriends = 0,
    this.isDeclined = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
          'https://picsum.photos/200/300', // Replace with actual image URL
        ),
      ),
      title: Text(
        '$name $username',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: isDeclined
          ? const Text('Restore')
          : Text(
              '$mutualFriends mutual friends',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
      trailing: ElevatedButton(
        onPressed: onPressed,
        child: isDeclined
            ? const Text('Restore')
            : const Text(
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
    super.key,
    required this.name,
    required this.username,
    this.isChat = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
          'https://picsum.photos/200/300', // Replace with actual image URL
        ),
      ),
      title: Text(
        '$name $username',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: isChat ? const Icon(Icons.chat_bubble_outline) : null,
      onTap: onPressed,
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; // For JWT storage
import 'package:social_flutter/app_bar.dart';
import 'package:social_flutter/commonnav.dart';
import 'package:social_flutter/constants/constant_url.dart';
import 'package:social_flutter/drawer.dart';

class Freind1 extends StatefulWidget {
  const Freind1({super.key});

  @override
  State<Freind1> createState() => _Freind1State();
}

class _Freind1State extends State<Freind1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      drawer: const AppDrawer(),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const TabBar(
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
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

class FriendsTab extends StatefulWidget {
  const FriendsTab({super.key});

  @override
  State<FriendsTab> createState() => _FriendsTabState();
}

class _FriendsTabState extends State<FriendsTab> {
  List<dynamic> friends = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchFriends();
  }

  Future<void> _fetchFriends() async {
    try {
      // Get JWT token from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('jwt_token'); // Ensure token is stored

      if (token == null) {
        throw Exception('JWT token is missing');
      }

      // Make API request to fetch the friend list
      final response = await http.get(
        Uri.parse('http://${APIConstants.commonURL}/api/v1/users/me'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          friends = data['data']['doc']['friends']; // Access the friends list
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load friends: ${response.body}');
      }
    } catch (e) {
      print('Error fetching friends: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _removeFriend(String friendId) async {
    setState(() {
      isLoading = true; // Show loading spinner during API call
    });

    try {
      // Get JWT token from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('jwt_token');

      if (token == null) {
        throw Exception('JWT token is missing');
      }

      // Make DELETE request to remove friend
      final response = await http.get(
        Uri.parse(
            'http://${APIConstants.commonURL}/api/v1/users/remfriend/$friendId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 204) {
        // Remove the friend from the local list
        setState(() {
          friends.removeWhere((friend) => friend['_id'] == friendId);
          isLoading = false; // Turn off loading
        });
      } else {
        throw Exception('Failed to remove friend: ${response.body}');
      }
    } catch (e) {
      print('Error removing friend: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (friends.isEmpty) {
      return const Center(child: Text('No friends available.'));
    }

    return ListView.builder(
      itemCount: friends.length,
      itemBuilder: (context, index) {
        final friend = friends[index];
        return FriendItem(
          name: friend['name'],
          imageUrl:
              'http://${APIConstants.commonURL}/img/users/${friend['photo']}',
          onRemove: () {
            _removeFriend(friend['_id']);
          },
        );
      },
    );
  }
}

class FriendItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final VoidCallback onRemove;

  const FriendItem({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(name),
      trailing: IconButton(
        icon: const Icon(Icons.remove_circle),
        onPressed: onRemove, // Trigger the onRemove callback when pressed
      ),
    );
  }
}

class RequestsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Requests'),
    );
  }
}

class SuggestionsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Suggestions'),
    );
  }
}

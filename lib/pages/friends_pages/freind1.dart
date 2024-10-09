import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
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
    // Using MediaQuery for adaptive layouts
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const AppBarWidget(),
      drawer: const AppDrawer(),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            SizedBox(
              width: screenWidth * 0.9, // Responsive width
              child: const TabBar(
                tabs: [
                  Tab(text: 'Friends'),
                  Tab(text: 'Requests'),
                  Tab(text: 'Suggestions'),
                ],
              ),
            ),
            const Expanded(
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
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('jwt_token');

      if (token == null) {
        throw Exception('JWT token is missing');
      }

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
          friends = data['data']['doc']['friends'];
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
      isLoading = true;
    });

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('jwt_token');

      if (token == null) {
        throw Exception('JWT token is missing');
      }

      final response = await http.get(
        Uri.parse(
            'http://${APIConstants.commonURL}/api/v1/users/remfriend/$friendId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 204) {
        setState(() {
          friends.removeWhere((friend) => friend['_id'] == friendId);
          isLoading = false;
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

    // Responsive layout using ListView.builder
    return ListView.builder(
      itemCount: friends.length,
      itemBuilder: (context, index) {
        final friend = friends[index];
        return FriendItems(
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

class FriendItems extends StatelessWidget {
  final String name;
  final String imageUrl;
  final VoidCallback onRemove;

  const FriendItems({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
        radius: screenWidth * 0.06, // Responsive avatar size
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: screenWidth * 0.045), // Responsive text size
      ),
      trailing: IconButton(
        icon: Icon(Icons.remove_circle, size: screenWidth * 0.06),
        onPressed: onRemove,
      ),
    );
  }
}

class RequestsTab extends StatelessWidget {
  const RequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Requests'),
    );
  }
}

class SuggestionsTab extends StatelessWidget {
  const SuggestionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Suggestions'),
    );
  }
}

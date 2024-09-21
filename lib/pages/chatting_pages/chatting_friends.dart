import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_flutter/app_bar.dart';
import 'package:social_flutter/commonnav.dart';
import 'package:social_flutter/constants/constant_url.dart';
import 'package:social_flutter/drawer.dart';
import 'chatting_page.dart'; // Import ChattingPage

class ChattingFriends extends StatefulWidget {
  const ChattingFriends({super.key});

  @override
  State<ChattingFriends> createState() => _ChattingFriendsState();
}

class _ChattingFriendsState extends State<ChattingFriends> {
  List<dynamic> friends = [];
  String? userId;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchFriends();
  }

  Future<void> _fetchFriends() async {
    try {
      // Retrieve JWT token from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('jwt_token');
      print(token);

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

        final String fetchedUserId = data['data']['doc']['_id'];

        setState(() {
          userId = fetchedUserId;
          friends = data['data']['doc']['friends'];
          isLoading = false;
        });

        await prefs.setString('user_id', fetchedUserId);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      drawer: const AppDrawer(),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : friends.isEmpty
              ? const Center(child: Text('No friends available.'))
              : ListView.builder(
                  itemCount: friends.length,
                  itemBuilder: (context, index) {
                    final friend = friends[index];
                    return GestureDetector(
                      onTap: () {
                        // Ensure userId is available before navigating
                        if (userId != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChattingPage(
                                friendId: friend['_id'],
                                userId: userId!,
                                friendName: friend['name'],
                              ),
                            ),
                          );
                        }
                      },
                      child: FriendItem(
                        name: friend['name'],
                        imageUrl:
                            'http://${APIConstants.commonURL}/img/users/${friend['photo']}',
                      ),
                    );
                  },
                ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

class FriendItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const FriendItem({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(name),
    );
  }
}

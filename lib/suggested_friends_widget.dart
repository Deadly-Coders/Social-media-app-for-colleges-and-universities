import 'package:flutter/material.dart';
import 'package:social_flutter/constants/constant_url.dart';
import 'package:social_flutter/model/home_page_suggested_friends/api_suggested_service.dart';
import 'package:social_flutter/profile.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SuggestedFriendsSection extends StatefulWidget {
  const SuggestedFriendsSection({super.key});

  @override
  State<SuggestedFriendsSection> createState() =>
      _SuggestedFriendsSectionState();
}

class _SuggestedFriendsSectionState extends State<SuggestedFriendsSection> {
  final ApiSuggestedFriendsService apiService = ApiSuggestedFriendsService();
  List<dynamic> suggestedFriends = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchSuggestedFriends();
  }

  Future<void> _fetchSuggestedFriends() async {
    try {
      final friends = await apiService.suggestFriends();
      setState(() {
        suggestedFriends = friends;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching friends: $e');
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error fetching suggested friends: $e')),
        );
      });
    }
  }

  // New method to add a friend
  Future<void> _addFriend(String friendId, int index) async {
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
            'http://${APIConstants.commonURL}/api/v1/users/addfriend/$friendId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Friend added successfully!')),
        );

        setState(() {
          suggestedFriends.removeAt(index);
          isLoading = false;
        });
      } else {
        throw Exception('Failed to add friend: ${response.body}');
      }
    } catch (e) {
      print('Error adding friend: $e');
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error adding friend: $e')),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (suggestedFriends.isEmpty) {
      return Center(child: Text('No suggested friends available.'));
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.builder(
        itemCount: suggestedFriends.length,
        itemBuilder: (context, index) {
          final friend = suggestedFriends[index];
          final imageUrl =
              'http://${APIConstants.commonURL}/img/users/${friend['user']['photo']}';

          return _buildPersonCard(
            friend['user']['name'],
            imageUrl,
            friend['user']['_id'],
            index,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProfilePage(userId: friend['user']['_id']),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildPersonCard(
      String name, String imagePath, String friendId, int index,
      {required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(imagePath),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _addFriend(friendId, index);
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

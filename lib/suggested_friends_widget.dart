import 'package:flutter/material.dart';
import 'package:social_flutter/model/home_page_suggested_friends/api_suggested_service.dart';

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
      print(friends); // Debug: Print fetched friends
      setState(() {
        suggestedFriends = friends;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching friends: $e');
      setState(() {
        isLoading = false;
        // Display an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error fetching suggested friends: $e')),
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var friend in suggestedFriends.take(3)) // Show max 3 friends
              _buildPersonCard(
                friend['user']['name'], // Adjust based on your API response
                friend['user']['photo'], // Adjust based on your API response
                onPressed: () {
                  Navigator.pushNamed(context, 'Profile');
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonCard(String name, String imagePath,
      {required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: imagePath.startsWith('http')
                ? NetworkImage(imagePath) // Use network image if it's a URL
                : AssetImage(
                    'assets/images/default_avatar.png'), // Default asset
          ),
          SizedBox(width: 16),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              // Handle add friend logic
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}

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
      height: MediaQuery.of(context).size.height * 0.2, // Adjusted height
      child: ListView.builder(
        itemCount: suggestedFriends.length, // Total number of friends
        itemBuilder: (context, index) {
          final friend = suggestedFriends[index];
          return _buildPersonCard(
            friend['user']['name'],
            friend['user']['photo'],
            onPressed: () {
              Navigator.pushNamed(context, 'Profile');
            },
          );
        },
      ),
    );
  }

  Widget _buildPersonCard(String name, String imagePath,
      {required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(16.0), // Add padding around the card
        margin: EdgeInsets.symmetric(vertical: 8.0), // Add margin between cards
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30, // Increase size of avatar
              backgroundImage: imagePath.startsWith('http')
                  ? NetworkImage(imagePath) // Use network image if it's a URL
                  : AssetImage(
                      'assets/images/default_avatar.png'), // Default asset
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 18, // Increase font size for name
                  fontWeight: FontWeight.bold, // Make the name bold
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle add friend logic
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

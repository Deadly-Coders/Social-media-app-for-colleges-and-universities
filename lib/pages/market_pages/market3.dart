import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_flutter/app_bar.dart';
import 'package:social_flutter/commonnav.dart';
import 'package:social_flutter/constants/constant_url.dart';
import 'package:social_flutter/drawer.dart';

class Market3 extends StatefulWidget {
  final String title;
  const Market3({
    super.key,
    required this.title,
  });

  @override
  State<Market3> createState() => _Market3State();
}

class _Market3State extends State<Market3> {
  List<dynamic> marketItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMarketData();
  }

  // Function to fetch data from the API
  Future<void> fetchMarketData() async {
    try {
      final apiUrl = Uri.parse(
          'http://${APIConstants.commonURL}/api/v1/market/user-market');

      // Retrieve the stored JWT token from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('jwt_token');

      if (token == null) {
        throw Exception('No JWT token found. Please log in again.');
      }

      // Make the API request
      final response = await http.get(
        apiUrl,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          marketItems = data['data']['market']; // Fetch the market items
          isLoading = false;
        });
      } else {
        print('Failed to load market items: ${response.statusCode}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching market data: $e');
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
          : SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search your items',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Your Uploads',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: marketItems.length,
                    itemBuilder: (context, index) {
                      final item = marketItems[index];
                      return _buildUploadCard(
                        item['photo'], // Replace with actual photo URL from API
                        item['title'],
                        item['description'],
                        item['price'].toString(),
                        context,
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'Market1');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 48,
                          vertical: 16,
                        ),
                      ),
                      child: const Text(
                        'Upload New Item',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

// Update the base URL to your server's URL where the images are hosted
const String baseImageUrl = 'http://${APIConstants.commonURL}/img/market/';

// Widget to build each market item card
Widget _buildUploadCard(String imageUrl, String title, String description,
    String price, BuildContext context) {
  return Card(
    clipBehavior: Clip.antiAlias,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _loadImage(context,
            imageUrl), // Method to handle image loading with error handling
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'INR $price',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// Function to load the image with try-catch for error handling
Widget _loadImage(BuildContext context, String imageUrl) {
  try {
    // Combine the base URL with the image path to get the full URL
    final fullImageUrl = '$baseImageUrl$imageUrl';
    // Calculate the width of the image based on the screen size and grid column count
    final cardWidth =
        MediaQuery.of(context).size.width / 2 - 16; // Subtracting padding

    // Attempt to load image from network
    return Image.network(
      fullImageUrl,
      width: cardWidth, // Set the width to cover the full card width
      height: 100,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        // Print the error and return a placeholder image on failure
        print('Error loading image: $error');
        return Image.asset(
          'assets/image_placeholder.png',
          width: cardWidth,
          height: 100,
          fit: BoxFit.cover,
        );
      },
    );
  } catch (e) {
    // Handle any unexpected exceptions during the image loading process
    print('Exception caught while loading image: $e');
    return Image.asset(
      'assets/image_placeholder.png',
      width: MediaQuery.of(context).size.width / 2 - 16,
      height: 100,
      fit: BoxFit.cover,
    );
  }
}

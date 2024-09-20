import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; // For JWT storage

class ApiSuggestedFriendsService {
  final String baseUrl = Platform.isAndroid
      ? 'http://192.168.55.112:3000/api/v1/users'
      : 'http://192.168.55.112:3000/api/v1/users';

  Future<List<dynamic>> suggestFriends() async {
    // Get JWT token from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final token =
        prefs.getString('jwt_token'); // Ensure token is stored after login

    if (token == null) {
      throw Exception('JWT token is missing');
    }

    // Make the request with the JWT token
    final response = await http.get(
      Uri.parse('$baseUrl/sugstfriend'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Use the actual token
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data[
          'recommendations']; // Adjust based on your API response structure
    } else {
      throw Exception('Failed to fetch suggested friends: ${response.body}');
    }
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_flutter/constants/constant_url.dart';

class ApiSuggestedFriendsService {
  final String baseUrl = Platform.isAndroid
      ? 'http://${APIConstants.commonURL}/api/v1/users'
      : 'http://${APIConstants.commonURL}/api/v1/users';

  Future<List<dynamic>> suggestFriends() async {
    // Get JWT token from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');

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

  Future<Map<String, dynamic>> fetchUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwtToken');

    final response = await http.get(
      Uri.parse('$baseUrl/users/me'), // Replace with your correct endpoint
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch user data');
    }
  }
}

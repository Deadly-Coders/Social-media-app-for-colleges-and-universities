import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:social_flutter/constants/constant_url.dart';

class ApiService {
  final String baseUrl = Platform.isAndroid
      ? 'http://${APIConstants.commonURL}/api/v1/users/'
      : 'http://${APIConstants.commonURL}/api/v1/users/'; // Replace with your backend URL

  // Update the return type to Future<String?>
  Future<String?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['token']; // Extract the token
      print(token);
      return token; // Return the token
    } else {
      throw Exception('Failed to log in: ${response.body}');
    }
  }
}

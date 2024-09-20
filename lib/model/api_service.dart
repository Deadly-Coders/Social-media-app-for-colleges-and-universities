import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = Platform.isAndroid ? 'http://192.168.84.179:3000/api/v1/users/' : 'http://192.168.84.179:3000/api/v1/users/';// Replace with your backend URL

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      // Handle successful login
      print('Login successful: ${response.body}');
      // Parse and return the user data or token if needed
    } else {
      // Handle error
      throw Exception('Failed to log in: ${response.body}');
    }
  }
}

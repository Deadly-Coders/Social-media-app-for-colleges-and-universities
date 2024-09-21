import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // For JWT storage
import 'package:http/http.dart' as http;
import 'package:social_flutter/app_bar.dart';
import 'package:social_flutter/constants/constant_url.dart';
import 'dart:convert';

import 'package:social_flutter/drawer.dart'; // For JSON handling

class EditPassword extends StatefulWidget {
  const EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _changePassword() async {
    if (_formKey.currentState!.validate()) {
      try {
        final prefs = await SharedPreferences.getInstance();
        final token =
            prefs.getString('jwt_token'); // Fetch the stored JWT token

        if (token == null) {
          throw Exception('JWT token is missing. Please log in again.');
        }

        final response = await http.patch(
          Uri.parse(
              'http://${APIConstants.commonURL}/api/v1/users/updateMyPassword'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token', // Send current token
          },
          body: jsonEncode({
            'passwordCurrent': _oldPasswordController.text,
            'password': _newPasswordController.text,
            'passwordConfirm': _confirmPasswordController.text,
          }),
        );

        if (response.statusCode == 200) {
          // Password change was successful, handle new token
          final newToken = jsonDecode(response.body)['token']; // Get new token

          // Store the new token
          await prefs.setString('jwt_token', newToken);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password changed successfully.')),
          );

          // Optionally, redirect the user to the login screen or another page
          Navigator.pushNamed(context, "Settings3");
        } else {
          // Handle error response
          final errorMsg = jsonDecode(response.body)['message'];
          throw Exception(errorMsg);
        }
      } catch (e) {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error changing password: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Old Password',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _oldPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter Current Password',
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your current password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              Text(
                'New Password',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter New Password',
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a new password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              Text(
                'Confirm Password',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Confirm New Password',
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
                validator: (value) {
                  if (value != _newPasswordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _changePassword, // Call the change password method
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  textStyle: TextStyle(fontSize: 16),
                ),
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

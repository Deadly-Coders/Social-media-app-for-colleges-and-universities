import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences
import 'package:social_flutter/model/api_service.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({
    super.key,
    required this.title,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiService apiService = ApiService();

  void _login() async {
    // Basic validation
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both email and password.')),
      );
      return;
    }

    try {
      final token = await apiService.login(
        emailController.text,
        passwordController.text,
      );

      if (token != null) {
        // Store the token and navigate to Home
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwt_token', token); // Store the JWT token

        // Clear input fields
        emailController.clear();
        passwordController.clear();

        // Navigate to Home
        Navigator.pushNamed(context, "Home");
      } else {
        throw Exception('Login failed. No token received.');
      }
    } catch (e) {
      // Show error message if login fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Please log in to continue',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Username/Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _login, // Call the login function
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 16.0),
                textStyle:
                    const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              child: const Text('Log In'),
            ),
          ],
        ),
      ),
    );
  }
}

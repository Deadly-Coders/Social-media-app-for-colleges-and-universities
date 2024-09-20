import 'package:flutter/material.dart';
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
    try {
      await apiService.login(emailController.text, passwordController.text);
      // Navigate to another screen or show success message
      print('Login successful');
    } catch (e) {
      // Show error message
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: $e')),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Please log in to continue',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Username/Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _login, // Call the login function
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 16.0),
                textStyle:
                    TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              child: Text('Log In'),
            ),
            SizedBox(height: 16.0),
            Text('OR', style: TextStyle(fontSize: 16.0)),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle Apple login logic
              },
              icon: Icon(Icons.apple),
              label: Text('Apple'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 16.0),
                textStyle:
                    TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle Google login logic
              },
              icon: Icon(Icons.g_mobiledata),
              label: Text('Google'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 16.0),
                textStyle:
                    TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle Facebook login logic
              },
              icon: Icon(Icons.facebook),
              label: Text('Facebook'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 16.0),
                textStyle:
                    TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

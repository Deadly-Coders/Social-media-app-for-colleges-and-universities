import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For image picking
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // For specifying MIME type
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_flutter/app_bar.dart';
import 'package:social_flutter/constants/constant_url.dart';
import 'package:social_flutter/drawer.dart'; // To access the stored JWT token

class Market1 extends StatefulWidget {
  const Market1({super.key});

  @override
  State<Market1> createState() => _Market1State();
}

class _Market1State extends State<Market1> {
  File? _selectedImage;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  bool _isLoading = false;

  // Function to pick image from gallery or camera
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  // Function to upload item to the market API with JWT token
  Future<void> _uploadItem() async {
    setState(() {
      _isLoading = true; // Set loading state
    });

    try {
      final apiUrl =
          Uri.parse('http://${APIConstants.commonURL}/api/v1/market');

      // Retrieve the stored JWT token from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('jwt_token');

      if (token == null) {
        throw Exception('No JWT token found. Please log in again.');
      }

      var request = http.MultipartRequest('POST', apiUrl);
      request.fields['title'] = _titleController.text;
      request.fields['description'] = _descriptionController.text;
      request.fields['price'] = _priceController.text;

      // Add the JWT token to the request headers
      request.headers['Authorization'] = 'Bearer $token';

      if (_selectedImage != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'photo', // Field name in the backend API
          _selectedImage!.path,
          contentType:
              MediaType('image', 'jpeg'), // Adjust MIME type if necessary
        ));
      }

      final response = await request.send();

      if (response.statusCode == 200) {
        // Display Snackbar for success
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data Updated Successfully')),
        );

        // Reset the fields after successful upload
        setState(() {
          _selectedImage = null;
          _titleController.clear();
          _descriptionController.clear();
          _priceController.clear();
        });
      } else {
        print("Failed to upload item: ${response.statusCode}");
        final responseData = await response.stream.bytesToString();
        print("Response body: $responseData");
      }
    } catch (e) {
      print("Error during upload: $e");
    } finally {
      setState(() {
        _isLoading = false; // Stop loading state
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Upload Item to Market',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: _selectedImage == null
                        ? const Icon(
                            Icons.add,
                            size: 48,
                            color: Colors.grey,
                          )
                        : Image.file(_selectedImage!, fit: BoxFit.cover),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Title',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'e.g., Selling a pencil',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  hintText: 'e.g., Looks good, almost new.',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Price',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
                  hintText: 'e.g., INR 2000',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : _uploadItem, // Disable button during loading
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Post Item'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

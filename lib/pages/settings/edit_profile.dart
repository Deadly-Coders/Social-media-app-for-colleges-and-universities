import 'package:flutter/material.dart';
import 'dart:io'; // For using File
import 'dart:convert'; // For decoding JSON
import 'package:http/http.dart' as http; // For making API requests
import 'package:image_picker/image_picker.dart'; // Image picker package
import 'package:shared_preferences/shared_preferences.dart'; // For JWT storage
import 'package:social_flutter/app_bar.dart';
import 'package:social_flutter/constants/constant_url.dart';
import 'package:social_flutter/drawer.dart';
import 'package:social_flutter/model/settings_model/user_model.dart';
import 'package:http_parser/http_parser.dart'; // For setting the MIME type
import 'package:mime/mime.dart'; // For looking up MIME type

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  File? _selectedImage; // To hold the selected image file
  UserModel? _user; // Hold user data using UserModel
  bool _isLoading = true; // To show a loading indicator while fetching data

  // TextEditingControllers for each input field
  final TextEditingController _graduationStartController =
      TextEditingController();
  final TextEditingController _graduationEndController =
      TextEditingController();
  final TextEditingController _collegeNameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _universityNameController =
      TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _interestsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchUserProfile(); // Fetch user profile when page is loaded
  }

  Future<void> _fetchUserProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('jwt_token'); // Ensure token is stored

      if (token == null) {
        throw Exception('JWT token is missing');
      }

      final response = await http.get(
        Uri.parse('http://${APIConstants.commonURL}/api/v1/users/me'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data']['doc'];

        setState(() {
          _user = UserModel.fromJson(data); // Parse response using UserModel
          _isLoading = false;

          // Initialize the controllers with fetched user data
          _graduationStartController.text =
              _user!.graduationStart.toString(); // Convert to String
          _graduationEndController.text =
              _user!.graduationEnd.toString(); // Convert to String
          _collegeNameController.text = _user!.collegeName;
          _birthDateController.text = _user!.birthDate;
          _universityNameController.text = _user!.universityName;
          _branchController.text = _user!.branch;
          _interestsController.text = _user!.interests.join(', ');
        });
      } else {
        throw Exception('Failed to load profile: ${response.body}');
      }
    } catch (e) {
      print('Error fetching profile: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Method to upload the image and user data
  Future<void> _uploadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');

    if (token == null) {
      throw Exception('JWT token is missing');
    }

    final request = http.MultipartRequest(
      'PATCH',
      Uri.parse('http://${APIConstants.commonURL}/api/v1/users/updateMe'),
    );

    request.headers['Authorization'] = 'Bearer $token';

    // Add the image file
    //import 'package:mime/mime.dart'; // Import mime package

    if (_selectedImage != null) {
      try {
        // Check if the image file exists and get MIME type
        final mimeType = lookupMimeType(_selectedImage!.path) ?? 'image/jpeg';

        print(
            "Uploading image from path: ${_selectedImage!.path} with MIME type: $mimeType");

        request.files.add(await http.MultipartFile.fromPath(
          'photo',
          _selectedImage!.path,
          contentType: MediaType.parse(mimeType), // Set correct MIME type
        ));
      } catch (e) {
        print("Error adding image file: $e");
      }
    } else {
      print("No image selected for upload");
    }

    // Add other user data
    request.fields['name'] = _user?.name ?? '';
    request.fields['email'] = _user?.email ?? '';
    request.fields['phone'] = _graduationStartController.text;
    request.fields['collegeName'] = _collegeNameController.text;
    request.fields['birthDate'] = _birthDateController.text;
    request.fields['graduationStart'] = _graduationStartController.text;
    request.fields['graduationEnd'] = _graduationEndController.text;
    request.fields['universityName'] = _universityNameController.text;
    request.fields['branch'] = _branchController.text;
    request.fields['interests'] = _interestsController.text;

    try {
      final response = await request.send();

      if (response.statusCode == 200) {
        // Handle success
        print('Profile updated successfully');
      } else {
        // Handle error
        print('Error updating profile: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading profile: $e');
    }
  }

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path); // Set the selected image
      });
      print("Selected image path: ${_selectedImage!.path}");
    } else {
      print("No image selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: const AppBarWidget(),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: _pickImage, // Open image picker when avatar is clicked
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _selectedImage != null
                        ? FileImage(_selectedImage!) // Display selected image
                        : NetworkImage(_user!.profileImageUrl)
                            as ImageProvider, // Display profile image from API
                    child: _selectedImage == null
                        ? Icon(
                            Icons.camera_alt,
                            size: 50,
                            color: Colors.white.withOpacity(0.7),
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: _user?.name ?? '',
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: _user?.email ?? '',
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _graduationStartController,
                  decoration:
                      const InputDecoration(labelText: 'Graduation Start'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _graduationEndController,
                  decoration:
                      const InputDecoration(labelText: 'Graduation End'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _collegeNameController,
                  decoration: const InputDecoration(labelText: 'College Name'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _birthDateController,
                  decoration: const InputDecoration(labelText: 'Birth Date'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _universityNameController,
                  decoration:
                      const InputDecoration(labelText: 'University Name'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _branchController,
                  decoration: const InputDecoration(labelText: 'Branch'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _interestsController,
                  decoration: const InputDecoration(labelText: 'Interests'),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _uploadProfile(); // Call the upload method here
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('Save Changes'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

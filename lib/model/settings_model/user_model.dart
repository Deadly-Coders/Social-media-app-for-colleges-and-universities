import 'package:social_flutter/constants/constant_url.dart';

class UserModel {
  final String name;
  final String email;
  final String collegeName;
  final String birthDate;
  final int graduationStart; // Store as an integer
  final int graduationEnd; // Store as an integer
  final String universityName;
  final String branch;
  final List<String> interests;
  final String profileImageUrl;

  UserModel({
    required this.name,
    required this.email,
    required this.collegeName,
    required this.birthDate,
    required this.graduationStart,
    required this.graduationEnd,
    required this.universityName,
    required this.branch,
    required this.interests,
    required this.profileImageUrl,
  });

  // Factory constructor to create UserModel from JSON response
  factory UserModel.fromJson(Map<String, dynamic> json) {
    // Parse graduationStart and graduationEnd as integers
    int parseInt(dynamic value) {
      if (value is int) {
        return value;
      } else if (value is String) {
        return int.tryParse(value) ?? 0; // Parse if it was stored as a string
      }
      return 0;
    }

    return UserModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      collegeName: json['collegeName'] ?? '',
      birthDate: json['birthDate'] ?? '',
      graduationStart: parseInt(json['graduationStart']), // Parse as int
      graduationEnd: parseInt(json['graduationEnd']), // Parse as int
      universityName: json['universityName'] ?? '',
      branch: json['branch'] ?? '',
      interests: (json['interests'] as List?)
              ?.map((item) => item.toString())
              .toList() ??
          [],
      profileImageUrl:
          'http://${APIConstants.commonURL}/img/users/${json['photo'] ?? ''}',
    );
  }
}

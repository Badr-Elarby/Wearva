import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stylish_shopping/features/profile/data/models/user_model.dart';

class ProfileWebService {
  static const String baseUrl =
      'https://api.wearva.com'; // Replace with actual API URL

  // Get user data
  Future<UserModel> getUserData(String userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/users/$userId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer YOUR_TOKEN_HERE', // Replace with actual token
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return UserModel.fromJson(data);
      } else {
        throw Exception('Failed to load user data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error loading user data: $e');
    }
  }

  // Update user data
  Future<UserModel> updateUserData(String userId, UserModel user) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/users/$userId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer YOUR_TOKEN_HERE', // Replace with actual token
        },
        body: json.encode(user.toJson()),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return UserModel.fromJson(data);
      } else {
        throw Exception('Failed to update user data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error updating user data: $e');
    }
  }

  // Update profile picture
  Future<String> updateProfilePicture(String userId, String imagePath) async {
    try {
      // In a real app, you would upload the image file here
      // For now, we'll simulate with a mock response
      await Future.delayed(const Duration(seconds: 2));

      // Mock response - in real app, this would be the uploaded image URL
      return 'https://api.wearva.com/images/profile/$userId.jpg';
    } catch (e) {
      throw Exception('Error uploading profile picture: $e');
    }
  }

  // Logout
  Future<bool> logout() async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/logout'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer YOUR_TOKEN_HERE', // Replace with actual token
        },
      );

      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Error logging out: $e');
    }
  }

  // Get user statistics
  Future<Map<String, dynamic>> getUserStats(String userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/users/$userId/stats'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer YOUR_TOKEN_HERE', // Replace with actual token
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load user stats: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error loading user stats: $e');
    }
  }
}

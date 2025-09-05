import 'package:flutter/material.dart';

class ProfileCubit extends ChangeNotifier {
  // User data state
  Map<String, dynamic> _userData = {
    'name': 'John Doe',
    'email': 'john.doe@example.com',
    'phone': '+1 234 567 8900',
    'avatar': 'assets/images/demo.png',
    'joinDate': 'January 2024',
    'totalOrders': 12,
    'totalSpent': 1250.50,
  };

  // Loading state
  bool _isLoading = false;

  // Getters
  Map<String, dynamic> get userData => _userData;
  bool get isLoading => _isLoading;

  // Update user data
  void updateUserData(Map<String, dynamic> newData) {
    _userData = {..._userData, ...newData};
    notifyListeners();
  }

  // Update specific field
  void updateField(String key, dynamic value) {
    _userData[key] = value;
    notifyListeners();
  }

  // Set loading state
  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // Load user data (simulate API call)
  Future<void> loadUserData() async {
    setLoading(true);

    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));

    // In real app, this would be an API call
    // For now, we'll keep the mock data
    setLoading(false);
  }

  // Update profile picture
  Future<void> updateProfilePicture(String imagePath) async {
    setLoading(true);

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    _userData['avatar'] = imagePath;
    setLoading(false);
  }

  // Logout
  void logout() {
    _userData.clear();
    notifyListeners();
  }
}

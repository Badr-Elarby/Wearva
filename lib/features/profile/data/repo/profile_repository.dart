import 'package:stylish_shopping/features/profile/data/models/user_model.dart';

abstract class ProfileRepository {
  Future<UserModel> getUserData();
  Future<UserModel> updateUserData(UserModel user);
  Future<String> updateProfilePicture(String imagePath);
  Future<bool> logout();
}

class ProfileRepositoryImpl implements ProfileRepository {
  // In a real app, this would use actual API calls
  // For now, we'll simulate with mock data

  @override
  Future<UserModel> getUserData() async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock user data
    return UserModel(
      id: '1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      phone: '+1 234 567 8900',
      avatar: 'assets/images/demo.png',
      joinDate: 'January 2024',
      totalOrders: 12,
      totalSpent: 1250.50,
      address: '123 Main Street',
      city: 'New York',
      country: 'USA',
    );
  }

  @override
  Future<UserModel> updateUserData(UserModel user) async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));

    // In real app, this would make an API call to update user data
    // For now, we'll just return the updated user
    return user;
  }

  @override
  Future<String> updateProfilePicture(String imagePath) async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));

    // In real app, this would upload the image and return the URL
    // For now, we'll just return the local path
    return imagePath;
  }

  @override
  Future<bool> logout() async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));

    // In real app, this would clear tokens and call logout API
    // For now, we'll just return true
    return true;
  }
}

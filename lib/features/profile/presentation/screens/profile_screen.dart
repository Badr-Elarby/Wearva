import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_shopping/core/utils/app_colors.dart';
import 'package:stylish_shopping/core/utils/app_styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 3; // Profile is active

  // بيانات المستخدم الوهمية
  final Map<String, dynamic> userData = {
    'name': 'Hemendra',
    'email': 'hemendra@example.com',
    'phone': '+1 234 567 8900',
    'avatar': 'assets/images/demo.png',
    'joinDate': 'January 2024',
    'totalOrders': 3,
    'totalSpent': 1250.50,
    'isVerified': true,
  };

  final List<Map<String, dynamic>> profileOptions = [
    {
      'icon': Icons.dark_mode_outlined,
      'title': 'Dark Mode',
      'subtitle': 'Switch to dark theme',
      'route': '/DarkMode',
      'hasSwitch': true,
      'switchValue': false,
    },
    {
      'icon': Icons.info_outline,
      'title': 'Account Information',
      'subtitle': 'View your account details',
      'route': '/AccountInfo',
    },
    {
      'icon': Icons.lock_outline,
      'title': 'Password',
      'subtitle': 'Change your password',
      'route': '/Password',
    },
    {
      'icon': Icons.shopping_bag_outlined,
      'title': 'Order',
      'subtitle': 'View your order history',
      'route': '/MyOrders',
    },
    {
      'icon': Icons.credit_card_outlined,
      'title': 'My Cards',
      'subtitle': 'Manage your payment cards',
      'route': '/MyCards',
    },
    {
      'icon': Icons.favorite_outline,
      'title': 'Wishlist',
      'subtitle': 'View your saved items',
      'route': '/FavouriteScreen',
    },
    {
      'icon': Icons.settings_outlined,
      'title': 'Settings',
      'subtitle': 'App settings and preferences',
      'route': '/Settings',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: AppBar(
        backgroundColor: AppColors.White,
        elevation: 0,
        title: Text('Profile', style: AppTextStyles.AlmostBlack22Semibold),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined, color: AppColors.AlmostBlack),
            onPressed: () {
              // Navigate to settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              margin: EdgeInsets.all(16.w),
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: AppColors.White,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Avatar
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 50.r,
                        backgroundImage: AssetImage(userData['avatar']),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            color: AppColors.LightPurple,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.White,
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            size: 16.sp,
                            color: AppColors.White,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // User Info
                  Text(
                    userData['name'],
                    style: AppTextStyles.AlmostBlack22Semibold,
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Verified Profile',
                        style: AppTextStyles.Grey11Regular,
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.check_circle,
                        color: AppColors.Green,
                        size: 16.sp,
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(userData['email'], style: AppTextStyles.Grey15Regular),
                  SizedBox(height: 16.h),

                  // Orders Button
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8.h),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.SoftCloud,
                        foregroundColor: AppColors.AlmostBlack,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                      ),
                      onPressed: () {
                        // Navigate to orders
                      },
                      child: Text(
                        '${userData['totalOrders']} Orders',
                        style: AppTextStyles.AlmostBlack13Semibold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Profile Options
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: AppColors.White,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children:
                    profileOptions.map((option) {
                      final isLast = profileOptions.last == option;
                      return Column(
                        children: [
                          ListTile(
                            leading: Container(
                              padding: EdgeInsets.all(8.w),
                              decoration: BoxDecoration(
                                color: AppColors.SoftCloud,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Icon(
                                option['icon'],
                                color: AppColors.LightPurple,
                                size: 20.sp,
                              ),
                            ),
                            title: Text(
                              option['title'],
                              style: AppTextStyles.AlmostBlack15Semibold,
                            ),
                            subtitle: Text(
                              option['subtitle'],
                              style: AppTextStyles.Grey11Regular,
                            ),
                            trailing:
                                option['hasSwitch'] == true
                                    ? Switch(
                                      value: option['switchValue'] ?? false,
                                      onChanged: (value) {
                                        setState(() {
                                          option['switchValue'] = value;
                                        });
                                      },
                                      activeColor: AppColors.LightPurple,
                                    )
                                    : Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: AppColors.Gray,
                                      size: 16.sp,
                                    ),
                            onTap:
                                option['hasSwitch'] == true
                                    ? null
                                    : () {
                                      if (option['route'] ==
                                          '/FavouriteScreen') {
                                        context.push(option['route']);
                                      } else {
                                        // Handle other routes
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              '${option['title']} - Coming Soon!',
                                            ),
                                            backgroundColor:
                                                AppColors.LightPurple,
                                          ),
                                        );
                                      }
                                    },
                          ),
                          if (!isLast)
                            Divider(
                              height: 1,
                              color: AppColors.SoftCloud,
                              indent: 60.w,
                            ),
                        ],
                      );
                    }).toList(),
              ),
            ),

            SizedBox(height: 20.h),

            // Logout Button
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.Red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                ),
                onPressed: () {
                  _showLogoutDialog();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, color: AppColors.White, size: 20.sp),
                    SizedBox(width: 8.w),
                    Text('Logout', style: AppTextStyles.White17Medium),
                  ],
                ),
              ),
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 0) {
            context.go('/Home');
          } else if (index == 1) {
            context.push('/FavouriteScreen');
          } else if (index == 2) {
            context.push('/CartScreen');
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.LightPurple,
        unselectedItemColor: AppColors.Gray,
        selectedLabelStyle: AppTextStyles.AlmostBlack13Semibold.copyWith(
          color: AppColors.LightPurple,
        ),
        unselectedLabelStyle: AppTextStyles.Grey11Regular,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        backgroundColor: AppColors.SoftCloud,
        elevation: 8,
        iconSize: 30.r,
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          title: Text('Logout', style: AppTextStyles.AlmostBlack17Semibold),
          content: Text(
            'Are you sure you want to logout?',
            style: AppTextStyles.Grey15Regular,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel', style: AppTextStyles.Grey15Regular),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.Red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                context.go('/login');
              },
              child: Text('Logout', style: AppTextStyles.White17Medium),
            ),
          ],
        );
      },
    );
  }
}

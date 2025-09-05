import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_shopping/core/utils/app_colors.dart';
import 'package:stylish_shopping/core/utils/app_styles.dart';

class UserStatsCard extends StatelessWidget {
  final Map<String, dynamic> userData;
  final VoidCallback? onAvatarTap;

  const UserStatsCard({Key? key, required this.userData, this.onAvatarTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.White,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          // Avatar
          Stack(
            children: [
              GestureDetector(
                onTap: onAvatarTap,
                child: CircleAvatar(
                  radius: 50.r,
                  backgroundImage: AssetImage(userData['avatar']),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: onAvatarTap,
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: AppColors.LightPurple,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.White, width: 2),
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      size: 16.sp,
                      color: AppColors.White,
                    ),
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
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          Text(
            userData['email'],
            style: AppTextStyles.Grey15Regular,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),

          // Stats Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem(
                'Orders',
                userData['totalOrders'].toString(),
                Icons.shopping_bag_outlined,
              ),
              Container(width: 1, height: 40.h, color: AppColors.SoftCloud),
              _buildStatItem(
                'Spent',
                '\$${userData['totalSpent'].toStringAsFixed(0)}',
                Icons.attach_money_outlined,
              ),
              Container(width: 1, height: 40.h, color: AppColors.SoftCloud),
              _buildStatItem(
                'Member Since',
                userData['joinDate'],
                Icons.calendar_today_outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppColors.LightPurple, size: 20.sp),
        SizedBox(height: 4.h),
        Text(value, style: AppTextStyles.AlmostBlack15Semibold),
        Text(label, style: AppTextStyles.Grey11Regular),
      ],
    );
  }
}

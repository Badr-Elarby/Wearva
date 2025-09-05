import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_shopping/core/utils/app_colors.dart';
import 'package:stylish_shopping/core/utils/app_styles.dart';

class ProfileOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool showDivider;
  final Color? iconColor;
  final Color? titleColor;
  final Color? subtitleColor;

  const ProfileOptionTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.showDivider = true,
    this.iconColor,
    this.titleColor,
    this.subtitleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              icon,
              color: iconColor ?? AppColors.LightPurple,
              size: 20.sp,
            ),
          ),
          title: Text(
            title,
            style: AppTextStyles.AlmostBlack15Semibold.copyWith(
              color: titleColor,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: AppTextStyles.Grey11Regular.copyWith(color: subtitleColor),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.Gray,
            size: 16.sp,
          ),
          onTap: onTap,
        ),
        if (showDivider)
          Divider(height: 1, color: AppColors.SoftCloud, indent: 60.w),
      ],
    );
  }
}

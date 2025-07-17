import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_shopping/core/utils/app_colors.dart';
import 'package:stylish_shopping/core/utils/app_styles.dart';

class BrandCard extends StatelessWidget {
  final String image;
  final String name;
  const BrandCard({required this.image, required this.name, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12.w),
      width: 110.w, // مستطيل ثابت العرض
      height: 44.h,
      decoration: BoxDecoration(
        color: AppColors.SoftCloud,
        borderRadius: BorderRadius.circular(12.r), // حواف دائرية خفيفة
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, width: 28.w, height: 28.w, fit: BoxFit.contain),
          SizedBox(width: 8.w),
          Flexible(
            child: Text(
              name,
              style: AppTextStyles.AlmostBlack15Semibold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

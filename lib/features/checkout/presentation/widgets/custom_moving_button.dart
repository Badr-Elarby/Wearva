import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_shopping/core/utils/app_colors.dart';
import 'package:stylish_shopping/core/utils/app_styles.dart';

class custom_moving_buttom extends StatelessWidget {
  const custom_moving_buttom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 60.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.LightPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          onPressed: () {
            context.push('/OrderConfirmationScreen');
          },
          child: Text('Save Address', style: AppTextStyles.White17Medium),
        ),
      ),
    );
  }
}

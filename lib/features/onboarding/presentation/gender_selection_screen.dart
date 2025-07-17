import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_shopping/core/utils/app_colors.dart';
import 'package:stylish_shopping/core/utils/app_styles.dart';

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({Key? key}) : super(key: key);

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String selectedGender = 'Men';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.LightPurple, AppColors.Gray],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 60.h),
            Image.asset('assets/images/welcome.png', height: 450.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              padding: EdgeInsets.all(15.w),
              decoration: BoxDecoration(
                color: AppColors.White,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.SteelNight,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Look Good, Feel Good',
                    style: AppTextStyles.AlmostBlack22Semibold,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Create your individual & unique style and look amazing everyday.',
                    style: AppTextStyles.Gray13Regular,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                selectedGender == 'Women'
                                    ? AppColors.LightPurple
                                    : AppColors.SoftCloud,
                            foregroundColor:
                                selectedGender == 'Women'
                                    ? AppColors.White
                                    : AppColors.AlmostBlack,
                            elevation: 4,
                            minimumSize: Size(double.infinity, 60.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),

                          onPressed: () {
                            setState(() => selectedGender = 'Women');
                          },
                          child: const Text('Women'),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                selectedGender == 'Men'
                                    ? AppColors.LightPurple
                                    : AppColors.SoftCloud,
                            foregroundColor:
                                selectedGender == 'Men'
                                    ? AppColors.White
                                    : AppColors.AlmostBlack,
                            elevation: 4,
                            minimumSize: Size(double.infinity, 60.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r), //
                            ),
                          ),
                          onPressed: () {
                            setState(() => selectedGender = 'Men');
                          },
                          child: const Text('Men'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  TextButton(
                    onPressed: () {
                      context.go('/Home');
                    },
                    child: Text('Skip', style: AppTextStyles.Grey17Medium),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

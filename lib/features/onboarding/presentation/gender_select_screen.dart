import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_shopping/core/utils/app_colors.dart';
import 'package:stylish_shopping/core/utils/app_styles.dart';

class GenderSelectScreen extends StatefulWidget {
  const GenderSelectScreen({Key? key}) : super(key: key);

  @override
  State<GenderSelectScreen> createState() => _GenderSelectScreenState();
}

class _GenderSelectScreenState extends State<GenderSelectScreen> {
  String selectedGender = 'Men';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 1.sh,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.LightPurple, AppColors.DarkCyanGray],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 60.h),
              // صورة الشخصيات
              Image.asset(
                'assets/images/gender_illustration.png', // ضع الصورة المناسبة هنا
                height: 260.h,
              ),
              SizedBox(height: 24.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: AppColors.White,
                  borderRadius: BorderRadius.circular(24.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Look Good, Feel Good',
                      style: AppTextStyles.AlmostBlack22Semibold,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Create your individual & unique style and look amazing everyday.',
                      style: AppTextStyles.Grey15Regular,
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
                                      : AppColors.Gray,
                              foregroundColor:
                                  selectedGender == 'Women'
                                      ? AppColors.White
                                      : AppColors.AlmostBlack,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            onPressed: () {
                              setState(() => selectedGender = 'Women');
                            },
                            child: Text(
                              'Women',
                              style: AppTextStyles
                                  .AlmostBlack15Semibold.copyWith(
                                color:
                                    selectedGender == 'Women'
                                        ? AppColors.White
                                        : AppColors.AlmostBlack,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  selectedGender == 'Men'
                                      ? AppColors.LightPurple
                                      : AppColors.Gray,
                              foregroundColor:
                                  selectedGender == 'Men'
                                      ? AppColors.White
                                      : AppColors.AlmostBlack,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            onPressed: () {
                              setState(() => selectedGender = 'Men');
                            },
                            child: Text(
                              'Men',
                              style: AppTextStyles
                                  .AlmostBlack15Semibold.copyWith(
                                color:
                                    selectedGender == 'Men'
                                        ? AppColors.White
                                        : AppColors.AlmostBlack,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    TextButton(
                      onPressed: () {
                        // هتعمل نافيجيشن بعدين
                      },
                      child: Text('Skip', style: AppTextStyles.Grey15Regular),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

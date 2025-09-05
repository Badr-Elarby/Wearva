import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_shopping/core/utils/app_colors.dart';
import 'package:stylish_shopping/core/utils/app_styles.dart';

class ConfirmCode extends StatelessWidget {
  const ConfirmCode({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> controllers = List.generate(
      4,
      (_) => TextEditingController(),
    );

    return Scaffold(
      backgroundColor: AppColors.SoftCloud,
      appBar: AppBar(
        backgroundColor: AppColors.SoftCloud,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: CircleAvatar(
            backgroundColor: AppColors.White,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.AlmostBlack,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    SizedBox(height: 8.h),
                    Text(
                      'Verification Code',
                      style: AppTextStyles.AlmostBlack22Semibold,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 32.h),
                    Center(child: Image.asset('assets/images/forget.png')),
                    SizedBox(height: 40.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(4, (index) {
                        return SizedBox(
                          width: 56.w,
                          height: 56.w,
                          child: TextField(
                            controller: controllers[index],
                            textAlign: TextAlign.center,
                            style: AppTextStyles.AlmostBlack22Semibold,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            decoration: InputDecoration(
                              counterText: '',
                              filled: true,
                              fillColor: AppColors.White,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide: BorderSide(color: AppColors.Gray),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide: BorderSide(color: AppColors.Gray),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide: BorderSide(
                                  color: AppColors.LightPurple,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),

                    SizedBox(height: 200.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '00:20',
                          style: AppTextStyles.AlmostBlack15Semibold,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'resend confirmation code.',
                          style: AppTextStyles.Gray13Regular,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
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
                    context.push('/NewPassword');
                  },
                  child: Text(
                    'Confirm Code',
                    style: AppTextStyles.White17Medium,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_shopping/core/utils/app_colors.dart';
import 'package:stylish_shopping/core/utils/app_styles.dart';
import 'package:stylish_shopping/features/checkout/presentation/widgets/custom_moving_button.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<Address> {
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.SoftCloud,
      appBar: AppBar(
        backgroundColor: AppColors.White,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.AlmostBlack,
          ),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              context.pop();
            } else {
              context.go('/Home');
            }
          },
        ),
        title: Text('Address', style: AppTextStyles.AlmostBlack22Semibold),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name', style: AppTextStyles.AlmostBlack17Medium),
            SizedBox(height: 6.h),
            TextField(
              decoration: InputDecoration(
                hintText: 'Your Name',
                hintStyle: AppTextStyles.Grey15Regular,
                filled: true,
                fillColor: AppColors.White,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12.h,
                ),
              ),
            ),
            SizedBox(height: 14.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Country', style: AppTextStyles.AlmostBlack17Medium),
                      SizedBox(height: 6.h),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Country',
                          hintStyle: AppTextStyles.Grey15Regular,
                          filled: true,
                          fillColor: AppColors.White,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('City', style: AppTextStyles.AlmostBlack17Medium),
                      SizedBox(height: 6.h),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'City',
                          hintStyle: AppTextStyles.Grey15Regular,
                          filled: true,
                          fillColor: AppColors.White,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),
            Text('Phone Number', style: AppTextStyles.AlmostBlack17Medium),
            SizedBox(height: 6.h),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: '+20 100 000 0000',
                hintStyle: AppTextStyles.Grey15Regular,
                filled: true,
                fillColor: AppColors.White,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12.h,
                ),
              ),
            ),
            SizedBox(height: 14.h),
            Text('Address', style: AppTextStyles.AlmostBlack17Medium),
            SizedBox(height: 6.h),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      hintText: 'Enter your address or use location',
                      hintStyle: AppTextStyles.Grey15Regular,
                      filled: true,
                      fillColor: AppColors.White,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                IconButton(
                  icon: Icon(Icons.my_location, color: AppColors.LightPurple),
                  onPressed: () {
                    // هنا هتضيف لوجيك اللوكيشن بعدين
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Location logic will be added later!'),
                      ),
                    );
                  },
                  tooltip: 'Use current location',
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Save as primary address',
                  style: AppTextStyles.Grey15Regular,
                ),
                Switch(
                  value: true,
                  onChanged: (val) {},
                  activeColor: AppColors.LightPurple,
                ),
              ],
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedPadding(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: EdgeInsets.fromLTRB(
          16.w,
          0,
          16.w,
          MediaQuery.of(context).viewInsets.bottom + 16.h,
        ),
        child: custom_moving_buttom(),
      ),
    );
  }
}

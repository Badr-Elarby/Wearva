import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_shopping/core/utils/app_colors.dart';
import 'package:stylish_shopping/core/utils/app_styles.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedSize = 2; // 0:S, 1:M, 2:L, 3:XL, 4:2XL
  final List<String> sizes = ['S', 'M', 'L', 'XL', '2XL'];
  final List<String> images = [
    'assets/images/small_demo1.png',
    'assets/images/small_demo2.png',
    'assets/images/small_demo3.png',
    'assets/images/small_demo4.png',
  ];
  bool _isExpanded = false;

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
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: AppColors.AlmostBlack,
            ),
            onPressed: () {
              context.push('/CartScreen');
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 80.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // صورة المنتج الرئيسية
                Center(
                  child: Image.asset(
                    'assets/images/demo.png',
                    height: 260.h,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 12.h),
                // صور مصغرة
                SizedBox(
                  height: 60.h,
                  child: Row(
                    children: List.generate(
                      images.length,
                      (index) => Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.asset(
                              images[index],
                              height: 60.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                // اسم المنتج والسعر
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Men's Printed Pullover Hoodie",
                        style: AppTextStyles.Grey15Regular,
                      ),
                      Text('Price', style: AppTextStyles.Grey15Regular),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 4.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Nike Club Fleece',
                          style: AppTextStyles.AlmostBlack22Semibold,
                        ),
                      ),
                      Text(
                        '\$99',
                        style: AppTextStyles.AlmostBlack22Semibold.copyWith(
                          color: AppColors.LightPurple,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Size', style: AppTextStyles.AlmostBlack15Semibold),
                      Text('Size Guide', style: AppTextStyles.Grey11Regular),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      sizes.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: ChoiceChip(
                          label: Text(
                            sizes[index],
                            style: AppTextStyles.AlmostBlack15Semibold,
                          ),
                          selected: selectedSize == index,
                          selectedColor: AppColors.LightPurple,
                          backgroundColor: AppColors.White,
                          labelStyle: TextStyle(
                            color:
                                selectedSize == index
                                    ? AppColors.White
                                    : AppColors.AlmostBlack,
                          ),
                          onSelected:
                              (_) => setState(() => selectedSize = index),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                // Description
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    'Description',
                    style: AppTextStyles.AlmostBlack17Semibold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with Read More...',
                        style: AppTextStyles.Grey15Regular,
                        maxLines: _isExpanded ? null : 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (!_isExpanded)
                        TextButton(
                          onPressed: () => setState(() => _isExpanded = true),
                          child: Text(
                            'Read Less',
                            style: AppTextStyles.LightPurple15Medium,
                          ),
                        ),
                      if (_isExpanded)
                        TextButton(
                          onPressed: () => setState(() => _isExpanded = false),
                          child: Text(
                            'Read More..',
                            style: AppTextStyles.LightPurple15Medium,
                          ),
                        ),
                    ],
                  ),
                ),
                // Reviews Placeholder
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reviews',
                        style: AppTextStyles.AlmostBlack17Semibold,
                      ),
                      Text('View All', style: AppTextStyles.Gray13Regular),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
          // زرار Add to Cart ثابت في الأسفل
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: AppColors.White,
              padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
              child: SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.LightPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  onPressed: () {
                    // UI فقط دلوقتي
                  },
                  child: Text(
                    'Add to Cart',
                    style: AppTextStyles.White17Medium,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

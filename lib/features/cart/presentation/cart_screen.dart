import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_shopping/core/utils/app_colors.dart';
import 'package:stylish_shopping/core/utils/app_styles.dart';
// import 'package:stylish_shopping/features/cart/data/models/cart_item_model.dart'; // لو عملت الموديل في ملف منفصل

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // بيانات وهمية مؤقتة
    final List<CartItemModel> cartItems = [
      CartItemModel(
        image: 'assets/images/demo.png',
        name: "Men's Tie-Dye T-Shirt Nike Sportswear  ",
        price: 99,
        tax: 4,
        qty: 1,
      ),
      CartItemModel(
        image: 'assets/images/demo.png',
        name: "Men's Tie-Dye T-Shirt Nike Sportswear",
        price: 45,
        tax: 4,
        qty: 1,
      ),
    ];

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
        title: Text('Cart', style: AppTextStyles.AlmostBlack22Semibold),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // المنتجات في الكارت
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Container(
                    margin: EdgeInsets.only(top: 16.h),
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: AppColors.White,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Image.asset(
                            item.image,
                            width: 64.w,
                            height: 64.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: AppTextStyles.AlmostBlack15Semibold,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                '\$${item.price} (+\$${item.tax}.00 Tax)',
                                style: AppTextStyles.Grey15Regular,
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  Icon(
                                    Icons.remove_circle_outline,
                                    size: 22,
                                    color: AppColors.Gray,
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    '${item.qty}',
                                    style: AppTextStyles.AlmostBlack15Semibold,
                                  ),
                                  SizedBox(width: 8.w),
                                  Icon(
                                    Icons.add_circle_outline,
                                    size: 22,
                                    color: AppColors.Gray,
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.delete_outline,
                                    color: AppColors.Gray,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 24.h),
            // Delivery Address
            GestureDetector(
              onTap: () {
                context.push('/Address');
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: AppColors.LightPurple),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        '43, Electronics City Phase 1, Electronic City',
                        style: AppTextStyles.AlmostBlack13Semibold,
                      ),
                    ),
                    Icon(Icons.check_circle, color: Colors.green, size: 20),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.Gray,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16.h),
            // زرار Checkout
            SizedBox(
              width: double.infinity,
              height: 60.h,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // أو context.go('/Home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.LightPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: Text(
                  'Continue Shopping',
                  style: AppTextStyles.White17Medium,
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

// لو عايز تعمل الموديل في نفس الملف مؤقتًا:
class CartItemModel {
  final String image;
  final String name;
  final double price;
  final double tax;
  final int qty;

  CartItemModel({
    required this.image,
    required this.name,
    required this.price,
    required this.tax,
    required this.qty,
  });
}

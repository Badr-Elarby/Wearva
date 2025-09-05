import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_shopping/core/utils/app_colors.dart';
import 'package:stylish_shopping/core/utils/app_styles.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  int _selectedIndex = 1; // Wishlist is active

  final List<Map<String, dynamic>> wishlistItems = [
    {
      'id': '1',
      'name': 'Nike Sportswear Club Fleece',
      'price': 99.99,
      'image': 'assets/images/demo.png',
      'isLiked': true,
    },
    {
      'id': '2',
      'name': 'Trail Running Jacket Nike Windrunner',
      'price': 99.99,
      'image': 'assets/images/demo.png',
      'isLiked': true,
    },
    {
      'id': '3',
      'name': 'Training Top Nike Sport Clash',
      'price': 100.00,
      'image': 'assets/images/demo.png',
      'isLiked': true,
    },
    {
      'id': '4',
      'name': 'Trail Running Jacket Nike Windrunner',
      'price': 70.00,
      'image': 'assets/images/demo.png',
      'isLiked': true,
    },
    {
      'id': '5',
      'name': 'Nike Sportswear Club Fleece',
      'price': 99.99,
      'image': 'assets/images/demo.png',
      'isLiked': true,
    },
    {
      'id': '6',
      'name': 'Trail Running Jacket Nike Windrunner',
      'price': 99.99,
      'image': 'assets/images/demo.png',
      'isLiked': true,
    },
  ];

  bool isEditMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
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
        title: Text('Wishlist', style: AppTextStyles.AlmostBlack22Semibold),
        centerTitle: true,
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
      body: Column(
        children: [
          // Wishlist Summary Section
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${wishlistItems.length} Items',
                      style: AppTextStyles.AlmostBlack17Semibold,
                    ),
                    Text('in wishlist', style: AppTextStyles.Grey11Regular),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.SoftCloud,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: TextButton.icon(
                    onPressed: () {
                      setState(() {
                        isEditMode = !isEditMode;
                      });
                    },
                    icon: Icon(
                      Icons.edit_outlined,
                      size: 16.sp,
                      color: AppColors.AlmostBlack,
                    ),
                    label: Text(
                      'Edit',
                      style: AppTextStyles.AlmostBlack13Medium,
                    ),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Products Grid
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 16.w,
                  childAspectRatio: 0.7,
                ),
                itemCount: wishlistItems.length,
                itemBuilder: (context, index) {
                  final item = wishlistItems[index];
                  return GestureDetector(
                    onTap: () {
                      context.push('/ProductDetails');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.White,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16.r),
                                  ),
                                  child: Image.asset(
                                    item['image'],
                                    width: double.infinity,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                // Like Button
                                Positioned(
                                  top: 8.h,
                                  right: 8.w,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        item['isLiked'] = !item['isLiked'];
                                        if (!item['isLiked']) {
                                          wishlistItems.removeAt(index);
                                        }
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(4.w),
                                      decoration: BoxDecoration(
                                        color: AppColors.White,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        item['isLiked']
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        size: 20.sp,
                                        color:
                                            item['isLiked']
                                                ? AppColors.Red
                                                : AppColors.AlmostBlack,
                                      ),
                                    ),
                                  ),
                                ),
                                // Remove Button in Edit Mode
                                if (isEditMode)
                                  Positioned(
                                    top: 8.h,
                                    left: 8.w,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          wishlistItems.removeAt(index);
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(4.w),
                                        decoration: BoxDecoration(
                                          color: AppColors.Red.withOpacity(0.9),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.remove,
                                          size: 16.sp,
                                          color: AppColors.White,
                                        ),
                                      ),
                                    ),
                                  ),
                                // Add to Cart Button
                                if (!isEditMode)
                                  Positioned(
                                    bottom: 8.h,
                                    right: 8.w,
                                    child: GestureDetector(
                                      onTap: () {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Added to cart: ${item['name']}',
                                            ),
                                            backgroundColor: AppColors.Green,
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(6.w),
                                        decoration: BoxDecoration(
                                          color: AppColors.LightPurple,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.add_shopping_cart,
                                          size: 16.sp,
                                          color: AppColors.White,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'],
                                  style: AppTextStyles.AlmostBlack15Semibold,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  '\$${item['price'].toStringAsFixed(2)}',
                                  style: AppTextStyles.AlmostBlack13Semibold,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 0) {
            context.go('/Home');
          } else if (index == 2) {
            context.push('/CartScreen');
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.LightPurple,
        unselectedItemColor: AppColors.Gray,
        selectedLabelStyle: AppTextStyles.AlmostBlack13Semibold.copyWith(
          color: AppColors.LightPurple,
        ),
        unselectedLabelStyle: AppTextStyles.Grey11Regular,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Wallet',
          ),
        ],
        backgroundColor: AppColors.SoftCloud,
        elevation: 8,
        iconSize: 30.r,
      ),
    );
  }
}

class WishlistItem {
  final String id;
  final String name;
  final double price;
  final String image;
  bool isLiked;

  WishlistItem({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.isLiked,
  });
}

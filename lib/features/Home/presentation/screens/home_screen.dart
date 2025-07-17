import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_shopping/core/utils/app_colors.dart';
import 'package:stylish_shopping/core/utils/app_styles.dart';
import 'package:stylish_shopping/features/Home/presentation/widgets/BrandCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: AppBar(
        backgroundColor: AppColors.White,
        elevation: 0,
        title: Text('Wearva', style: AppTextStyles.AlmostBlack22Semibold),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: AppColors.AlmostBlack),
            onPressed: () {},
          ),
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/demo.png'),
              radius: 18.r,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search, color: AppColors.Gray),
                  filled: true,
                  fillColor: AppColors.SoftCloud,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 16.w,
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Choose Brand',
                    style: AppTextStyles.AlmostBlack17Medium,
                  ),
                  TextButton(
                    onPressed: () {}, // هتظبطها بعدين لو عايز
                    child: Text('View All', style: AppTextStyles.Gray13Regular),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(50, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.h),

              SizedBox(
                height: 60.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    BrandCard(
                      image: 'assets/images/adidas.png',
                      name: 'Adidas',
                    ),
                    BrandCard(image: 'assets/images/adidas.png', name: 'Nike'),
                    BrandCard(image: 'assets/images/adidas.png', name: 'Fila'),
                    // زود البراندات اللي انت عايزها
                  ],
                ),
              ),

              SizedBox(height: 20.h),
              Text(
                'Popular Products',
                style: AppTextStyles.AlmostBlack17Medium,
              ),
              SizedBox(height: 15.h),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 16.w,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return Container(
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16.r),
                            ),
                            child: Image.asset('assets/images/demo.png'),
                          ), // صورة المنتج
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Product Name',
                                style: AppTextStyles.AlmostBlack13Medium,
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                '\$99.99',
                                style: AppTextStyles.AlmostBlack13Semibold,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            // هنا ممكن تضيف نافيجيشن حقيقي بعدين
          });
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
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        backgroundColor: AppColors.SoftCloud,
        elevation: 8,
        iconSize: 30.r,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_shopping/core/utils/app_colors.dart';
import 'package:stylish_shopping/core/utils/app_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 90.h),

                      Center(
                        child: Column(
                          children: [
                            Text(
                              'Welcome',
                              style: AppTextStyles.AlmostBlack28Semibold,
                            ),
                            Text(
                              'Please enter your data to continue',
                              style: AppTextStyles.Grey15Regular,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 80.h),

                      // Username Field
                      Text('Username', style: AppTextStyles.Grey15Regular),
                      SizedBox(height: 4.h),
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          hintText: 'Enter your username',
                          suffixIcon:
                              _usernameController.text.isNotEmpty
                                  ? const Icon(Icons.check, color: Colors.green)
                                  : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                        ),
                        onChanged: (_) => setState(() {}),
                      ),
                      SizedBox(height: 16.h),

                      // Password Field
                      Text('Password', style: AppTextStyles.Grey15Regular),
                      SizedBox(height: 4.h),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          suffixIcon:
                              _passwordController.text.length >= 8
                                  ? Padding(
                                    padding: EdgeInsets.only(right: 12.w),
                                    child: Text(
                                      'Strong',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                  : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                        ),
                        onChanged: (_) => setState(() {}),
                      ),
                      SizedBox(height: 8.h),

                      // Forgot Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            context.push('/ForgotPasswordScreen');
                          },
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),

                      // Remember Me Switch
                      Row(
                        children: [
                          Switch(
                            value: _rememberMe,
                            onChanged:
                                (val) => setState(() => _rememberMe = val),
                            activeColor: Colors.green,
                          ),
                          Text(
                            'Remember me',
                            style: AppTextStyles.Grey15Regular,
                          ),
                        ],
                      ),
                      SizedBox(height: 40.h),

                      // Terms and Conditions
                      Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text:
                                  'By connecting your account confirm that you agree with our ',
                              style: AppTextStyles.Grey15Regular,
                              children: [
                                TextSpan(
                                  text: 'Term and Condition',
                                  style: AppTextStyles.AlmostBlack15Medium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.LightPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                          ),
                          onPressed: () {
                            context.go('/GenderSelection');
                          },
                          child: Text(
                            'Login',
                            style: AppTextStyles.White17Medium,
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),

                      // Sign Up Link
                      Center(
                        child: GestureDetector(
                          onTap: () => context.go('/signup'),
                          child: RichText(
                            text: TextSpan(
                              text: "Don't have an account? ",
                              style: AppTextStyles.Grey15Regular,
                              children: [
                                TextSpan(
                                  text: 'Sign up',
                                  style: AppTextStyles.LightPurple15Medium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

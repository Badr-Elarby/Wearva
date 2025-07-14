import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_shopping/core/utils/app_colors.dart';
import 'package:stylish_shopping/core/utils/app_styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _agreeTerms = false;

  // إضافة متغيرات للتحقق
  bool get _isUsernameValid => _usernameController.text.trim().length >= 3;
  bool get _isEmailValid => RegExp(
    r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}",
  ).hasMatch(_emailController.text.trim());
  bool get _isPasswordValid => _passwordController.text.length >= 8;
  bool get _isConfirmPasswordValid =>
      _confirmPasswordController.text == _passwordController.text &&
      _isPasswordValid;

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 90.h),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Create Account',
                            style: AppTextStyles.AlmostBlack28Semibold,
                          ),
                          Text(
                            'Please fill in the details to sign up',
                            style: AppTextStyles.Grey15Regular,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 80.h),
                    Text('Username', style: AppTextStyles.Gray13Regular),
                    SizedBox(height: 4.h),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: 'Enter your username',
                        suffixIcon:
                            _isUsernameValid
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
                    Text('Email', style: AppTextStyles.Gray13Regular),
                    SizedBox(height: 4.h),
                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        suffixIcon:
                            _isEmailValid
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
                    Text('Password', style: AppTextStyles.Gray13Regular),
                    SizedBox(height: 4.h),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        suffixIcon:
                            _isPasswordValid
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
                    Text(
                      'Confirm Password',
                      style: AppTextStyles.Gray13Regular,
                    ),
                    SizedBox(height: 4.h),
                    TextField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Re-enter your password',
                        suffixIcon:
                            _isConfirmPasswordValid
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
                    Row(
                      children: [
                        Checkbox(
                          value: _agreeTerms,
                          onChanged:
                              (val) =>
                                  setState(() => _agreeTerms = val ?? false),
                          activeColor: AppColors.LightPurple,
                        ),

                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'I agree to ther ',
                            style: AppTextStyles.Gray13Regular,
                            children: [
                              TextSpan(
                                text: 'Term and Condition',
                                style: AppTextStyles.AlmostBlack13Semibold,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
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
                        onPressed: _agreeTerms ? () {} : null,
                        child: Text(
                          'Sign Up',
                          style: AppTextStyles.White17Medium,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Center(
                      child: GestureDetector(
                        onTap: () => context.go('/login'),
                        child: RichText(
                          text: TextSpan(
                            text: 'Already have an account? ',
                            style: AppTextStyles.Grey15Regular,
                            children: [
                              TextSpan(
                                text: 'Login',
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
            );
          },
        ),
      ),
    );
  }
}

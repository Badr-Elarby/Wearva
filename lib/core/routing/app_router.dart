import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_shopping/features/Home/presentation/screens/home_screen.dart';
import 'package:stylish_shopping/features/ProductDetails/presentation/ProductDetails.dart';
import 'package:stylish_shopping/features/auth/presentation/screens/confirm_code.dart';
import 'package:stylish_shopping/features/auth/presentation/screens/forget_password.dart';
import 'package:stylish_shopping/features/auth/presentation/screens/login_screen.dart';
import 'package:stylish_shopping/features/auth/presentation/screens/new_password.dart';
import 'package:stylish_shopping/features/auth/presentation/screens/signup_screen.dart';
import 'package:stylish_shopping/features/cart/presentation/cart_screen.dart';
import 'package:stylish_shopping/features/checkout/presentation/screens/address.dart';
import 'package:stylish_shopping/features/checkout/presentation/screens/order_confirmation.dart';
import 'package:stylish_shopping/features/favourite/presentaion/favourite.dart';
import 'package:stylish_shopping/features/onboarding/presentation/gender_selection_screen.dart';
import 'package:stylish_shopping/features/profile/presentation/screens/profile_screen.dart';
import 'package:stylish_shopping/features/splash/presentation/screens/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'SplashScreen',
      builder: (context, state) => const SplashScreen(),
    ),

    GoRoute(
      path: '/login',
      name: 'LoginScreen',
      builder: (context, state) => const LoginScreen(),
    ),

    GoRoute(
      path: '/signup',
      name: 'SignupScreen',
      builder: (context, state) => const SignUpScreen(),
    ),

    GoRoute(
      path: '/GenderSelection',
      name: 'GenderSelectionScreen',
      builder: (context, state) => const GenderSelectionScreen(),
    ),

    GoRoute(
      path: '/Home',
      name: 'HomeScreen',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/ProductDetails',
      name: 'ProductDetailsScreen',
      builder: (context, state) => const ProductDetailsScreen(),
    ),

    GoRoute(
      path: '/CartScreen',
      name: 'CartScreen',
      builder: (context, state) => const CartScreen(),
    ),

    GoRoute(
      path: '/FavouriteScreen',
      name: 'FavouriteScreen',
      builder: (context, state) => const FavouriteScreen(),
    ),

    GoRoute(
      path: '/Address',
      name: 'Address',
      builder: (context, state) => const Address(),
    ),

    GoRoute(
      path: '/OrderConfirmationScreen',
      name: 'OrderConfirmationScreen',
      builder: (context, state) => const OrderConfirmationScreen(),
    ),

    GoRoute(
      path: '/ForgotPasswordScreen',
      name: 'ForgotPasswordScreen',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),

    GoRoute(
      path: '/ConfirmCode',
      name: 'ConfirmCode',
      builder: (context, state) => const ConfirmCode(),
    ),

    GoRoute(
      path: '/NewPassword',
      name: 'NewPassword',
      builder: (context, state) => const NewPassword(),
    ),

    GoRoute(
      path: '/Profile',
      name: 'ProfileScreen',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);

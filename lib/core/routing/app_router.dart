import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_shopping/features/auth/presentation/screens/login_screen.dart';
import 'package:stylish_shopping/features/auth/presentation/screens/signup_screen.dart';
import 'package:stylish_shopping/features/onboarding/presentation/gender_selection_screen.dart';
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
  ],
);

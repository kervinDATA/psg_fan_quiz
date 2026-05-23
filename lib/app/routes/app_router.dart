import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/onboarding_screen.dart';
import '../../features/auth/presentation/screens/profile_setup_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/categories/presentation/screens/categories_screen.dart';

// Déclaration des constantes de chemins (Règles de nommage propres)
class AppRoutes {
  AppRoutes._();
  
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String profileSetup = '/profile-setup';
  static const String home = '/home';
  static const String categories = '/categories';
}

// Configuration globale de GoRouter pour le MVP
final goRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  debugLogDiagnostics: true, // Pratique pour suivre tes changements de routes dans la console
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: AppRoutes.profileSetup,
      builder: (context, state) => const ProfileSetupScreen(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.categories,
      builder: (context, state) => const CategoriesScreen(),
    ),
  ],
);
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/onboarding_screen.dart';
import '../../features/auth/presentation/screens/profile_setup_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/categories/presentation/screens/categories_screen.dart';
import '../../features/quiz/presentation/screens/quiz_screen.dart';
import '../../features/leaderboard/presentation/screens/leaderboard_screen.dart';
import '../../features/quiz/presentation/screens/result_screen.dart';

// Déclaration des constantes de chemins (Règles de nommage propres)
class AppRoutes {
  AppRoutes._();
  
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String profileSetup = '/profile-setup';
  static const String home = '/home';
  static const String categories = '/categories';
  static const String quiz = '/quiz';
  static const String leaderboard = '/leaderboard';
  static const String result = '/result'; // 👈 À rajouter dans la classe AppRoutes
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
    GoRoute(
      path: AppRoutes.quiz,
      builder: (context, state) {
        // On récupère le nom de la catégorie passé en paramètre invisible (extra)
        final categoryName = state.extra as String;
        return QuizScreen(category: categoryName);
      },
    ),
    GoRoute(
      path: AppRoutes.leaderboard,
      builder: (context, state) => const LeaderboardScreen(),
    ),
    GoRoute(
      path: AppRoutes.result,
      builder: (context, state) {
        // On récupère les données envoyées depuis l'écran de Quiz
        final extras = state.extra as Map<String, dynamic>;
        return ResultScreen(
          score: extras['score'] as int,
          correctAnswers: extras['correctAnswers'] as int,
          totalQuestions: extras['totalQuestions'] as int,
        );
      },
    ),
  ],
);
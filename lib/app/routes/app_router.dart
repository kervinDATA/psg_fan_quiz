import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Déclaration des constantes de chemins (Règles de nommage propres)
class AppRoutes {
  AppRoutes._();
  
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String profileSetup = '/profile-setup';
  static const String home = '/home';
}

// Configuration globale de GoRouter pour le MVP
final goRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  debugLogDiagnostics: true, // Pratique pour suivre tes changements de routes dans la console
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Écran Splash (Chargement...) 🔴🔵')),
      ),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Écran Onboarding 🚀')),
      ),
    ),
    GoRoute(
      path: AppRoutes.profileSetup,
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Écran Création Profil 👤')),
      ),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Écran Accueil - Ici c\'est Paris ! 🏟️')),
      ),
    ),
  ],
);
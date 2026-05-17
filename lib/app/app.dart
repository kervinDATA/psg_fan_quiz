import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'routes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Utilisation du constructeur .router pour déléguer la navigation à GoRouter
    return MaterialApp.router(
      title: 'PSG Fan Quiz',
      debugShowCheckedModeBanner: false,
      
      // Branchement de ton Design System officiel V1
      theme: AppTheme.darkTheme,
      
      // Branchement de ton routeur GoRouter
      routerConfig: goRouter,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/routes/app_router.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_spacing.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Déclenchement de la simulation de chargement
    _startLoadingDelay();
  }

  void _startLoadingDelay() {
    // Attente de 3 secondes avant de rediriger
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        // Redirection vers l'onboarding via GoRouter
        context.go(AppRoutes.onboarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.noirProfond,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PSG FAN QUIZ',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                color: AppColors.blanc,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8.0),
              width: 80,
              height: 4,
              color: AppColors.rougePSG,
            ),
            AppSpacing.h32,
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.rougePSG),
              strokeWidth: 3.0,
            ),
          ],
        ),
      ),
    );
  }
}
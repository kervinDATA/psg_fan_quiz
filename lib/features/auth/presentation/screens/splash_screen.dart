import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/routes/app_router.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_spacing.dart';
import '../../../../shared/providers/player_provider.dart';
import '../../data/repositories/auth_repository.dart';

// 🔴 NOUVEAU : On passe en ConsumerStatefulWidget pour lire Riverpod
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _authenticateAndRoute(); // 👈 On lance l'analyse au démarrage
  }

  Future<void> _authenticateAndRoute() async {
    // 1. Connexion anonyme silencieuse via notre repository
    final user = await ref.read(authRepositoryProvider).signInAnonymously();
    
    if (user != null) {
      // 2. On demande à la base de données si ce téléphone a déjà un profil
      final profileExists = await ref.read(playerProvider.notifier).loadProfile(user.uid);
      
      if (mounted) {
        if (profileExists) {
          // Si le profil existe, on zappe l'Onboarding et on va direct au Stade !
          context.go(AppRoutes.home);
        } else {
          // Sinon, c'est un nouveau supporter
          context.go(AppRoutes.onboarding);
        }
      }
    } else {
      // En cas de problème de connexion internet, on va vers l'Onboarding
      if (mounted) {
        context.go(AppRoutes.onboarding);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.noirProfond,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'PSG FAN QUIZ',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                color: AppColors.blanc,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              width: 80,
              height: 4,
              color: AppColors.rougePSG,
            ),
            AppSpacing.h32,
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.rougePSG),
              strokeWidth: 3.0,
            ),
          ],
        ),
      ),
    );
  }
}
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
    // 1. On regarde si un utilisateur est déjà connecté en mémoire
    final user = ref.read(authRepositoryProvider).currentUser;

    await Future.delayed(const Duration(seconds: 2)); // Petit délai visuel

    if (user != null) {
      // 2. S'il est connecté, on charge son profil
      final profileExists = await ref.read(playerProvider.notifier).loadProfile(user.uid);

      if (mounted) {
        if (profileExists) {
          context.go(AppRoutes.home); // Direction le jeu
        } else {
          context.go(AppRoutes.profileSetup); // Il s'est inscrit mais n'a pas fini son profil
        }
      }
    } else {
      // 3. 🔴 NOUVEAU : Aucun utilisateur connecté, on l'envoie découvrir l'application sur l'Onboarding
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
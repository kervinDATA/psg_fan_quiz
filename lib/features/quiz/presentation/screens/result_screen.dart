import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../app/routes/app_router.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_spacing.dart';
import '../../../../theme/app_typography.dart';
import '../../../../theme/app_radius.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int correctAnswers;
  final int totalQuestions;

  const ResultScreen({
    super.key,
    required this.score,
    required this.correctAnswers,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    // Calcul du pourcentage de réussite
    final double successRate = totalQuestions > 0 ? correctAnswers / totalQuestions : 0;
    
    // Message dynamique selon le score
    String feedbackMessage = 'Bien joué !';
    if (successRate == 1.0) feedbackMessage = 'PARFAIT ! LÉGENDE ! 🏆';
    else if (successRate >= 0.5) feedbackMessage = 'C\'EST DU SOLIDE ! 🔥';
    else feedbackMessage = 'IL FAUT S\'ENTRAÎNER ! 💪';

    return Scaffold(
      backgroundColor: AppColors.noirProfond,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.sections),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              
              // 1. Message de feedback animé
              Text(
                feedbackMessage,
                textAlign: TextAlign.center,
                style: AppTypography.h1.copyWith(color: AppColors.blanc),
              ).animate().fade(duration: 500.ms).scale(delay: 200.ms),

              AppSpacing.h32,

              // 2. Carte de statistiques animée
              Container(
                padding: const EdgeInsets.all(AppSpacing.sections),
                decoration: BoxDecoration(
                  color: AppColors.grisFonce,
                  borderRadius: AppRadius.m,
                  border: Border.all(color: AppColors.rougePSG, width: 2),
                ),
                child: Column(
                  children: [
                    Text('XP GAGNÉE', style: AppTypography.caption.copyWith(color: AppColors.grisClair)),
                    AppSpacing.h8,
                    Text('+$score XP', style: AppTypography.h1.copyWith(color: AppColors.jauneXP, fontSize: 48))
                        .animate(onPlay: (controller) => controller.repeat(reverse: true))
                        .shimmer(duration: 1200.ms, color: Colors.white),
                    
                    const Divider(color: AppColors.grisClair, height: 32),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStat('Bonnes\nRéponses', '$correctAnswers/$totalQuestions', AppColors.vertSucces),
                        _buildStat('Précision', '${(successRate * 100).toInt()}%', AppColors.blanc),
                      ],
                    ),
                  ],
                ),
              ).animate().fade(delay: 400.ms).moveY(begin: 50, duration: 600.ms, curve: Curves.easeOutBack),

              const Spacer(),

              // 3. Boutons d'action
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.go(AppRoutes.home),
                  child: const Text('RETOURNER AU VESTIAIRE'),
                ),
              ).animate().fade(delay: 800.ms).slideY(begin: 1.0),
              
              AppSpacing.h16,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value, Color valueColor) {
    return Column(
      children: [
        Text(value, style: AppTypography.h2.copyWith(color: valueColor)),
        AppSpacing.h4,
        Text(label, textAlign: TextAlign.center, style: AppTypography.caption.copyWith(color: AppColors.grisClair)),
      ],
    );
  }
}
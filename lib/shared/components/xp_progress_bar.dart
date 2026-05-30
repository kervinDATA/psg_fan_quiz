import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import '../../theme/app_radius.dart';

class XpProgressBar extends StatelessWidget {
  final int xp;
  final int level;

  const XpProgressBar({
    super.key,
    required this.xp,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    // Ta logique de leveling : 100 XP pour passer au niveau suivant
    final int currentLevelBaseXp = (level - 1) * 100;
    final int nextLevelXp = level * 100;
    final int xpInCurrentLevel = xp - currentLevelBaseXp;
    
    // Calcul du pourcentage de remplissage de la jauge (entre 0.0 et 1.0)
    final double progress = (xpInCurrentLevel / 100).clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Niveau $level', style: AppTypography.caption.copyWith(color: AppColors.blanc, fontWeight: FontWeight.bold)),
            Text('$xp / $nextLevelXp XP', style: AppTypography.caption.copyWith(color: AppColors.jauneXP)),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 12,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.noirProfond, // Fond de la jauge
            borderRadius: AppRadius.m,
            border: Border.all(color: AppColors.grisFonce, width: 1),
          ),
          child: Stack(
            children: [
              FractionallySizedBox(
                widthFactor: progress,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.jauneXP,
                    borderRadius: AppRadius.m,
                    boxShadow: [
                      // Petit effet de lueur (Glow) très Gaming
                      BoxShadow(
                        color: AppColors.jauneXP.withOpacity(0.5),
                        blurRadius: 6,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                // Animation de remplissage fluide au chargement
                ).animate().scaleX(begin: 0, duration: 800.ms, curve: Curves.easeOutCubic, alignment: Alignment.centerLeft),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
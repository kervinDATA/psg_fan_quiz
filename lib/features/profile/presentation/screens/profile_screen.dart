import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/providers/player_provider.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_radius.dart';
import '../../../../theme/app_spacing.dart';
import '../../../../theme/app_typography.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // On récupère les données du joueur en direct depuis Riverpod
    final player = ref.watch(playerProvider);

    return Scaffold(
      backgroundColor: AppColors.noirProfond,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Mon Profil', style: AppTypography.h3),
        centerTitle: true,
      ),
      body: player == null
          ? const Center(child: CircularProgressIndicator(color: AppColors.rougePSG))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.sections),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 1. En-tête : Avatar et Pseudo
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.grisFonce,
                    child: Text(player.avatar, style: const TextStyle(fontSize: 48)),
                  ),
                  AppSpacing.h16,
                  Text(player.pseudo, style: AppTypography.h1),
                  AppSpacing.h8,
                  Text(
                    'Niveau ${player.level} • ${player.xp} XP',
                    style: AppTypography.h3.copyWith(color: AppColors.jauneXP),
                  ),
                  
                  AppSpacing.h32,

                  // 2. Statistiques (Visuel pour la V1)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('STATISTIQUES', style: AppTypography.h3),
                  ),
                  AppSpacing.h16,
                  Row(
                    children: [
                      Expanded(child: _buildStatCard('Quiz Joués', 'Bientôt', Icons.sports_esports)),
                      AppSpacing.w16,
                      Expanded(child: _buildStatCard('Badges', 'Bientôt', Icons.shield)),
                    ],
                  ),

                  AppSpacing.h32,

                  // 3. Bouton Paramètres / Déconnexion (Pour la future V2)
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Fonctionnalité de déconnexion à venir...')),
                        );
                      },
                      icon: const Icon(Icons.settings, color: AppColors.grisClair),
                      label: const Text('PARAMÈTRES DU COMPTE'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.grisClair,
                        side: const BorderSide(color: AppColors.grisFonce),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(borderRadius: AppRadius.m),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  // Petit widget réutilisable pour afficher de belles cartes de statistiques
  Widget _buildStatCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.grisFonce,
        borderRadius: AppRadius.m,
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.grisClair, size: 32),
          AppSpacing.h8,
          Text(value, style: AppTypography.h2),
          AppSpacing.h4,
          Text(title, style: AppTypography.caption.copyWith(color: AppColors.grisClair)),
        ],
      ),
    );
  }
}
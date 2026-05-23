import 'package:flutter/material.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_radius.dart';
import '../../../../theme/app_spacing.dart';
import '../../../../theme/app_typography.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/routes/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.noirProfond,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.sections),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header Utilisateur (Données statiques pour le moment)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: AppColors.grisFonce,
                          shape: BoxShape.circle,
                        ),
                        child: const Text('🏆', style: TextStyle(fontSize: 24)),
                      ),
                      AppSpacing.w16,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('TitiParisien', style: AppTypography.h3),
                          Text(
                            'Niveau 7 • 1250 XP',
                            style: AppTypography.caption.copyWith(color: AppColors.jauneXP),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_none, color: AppColors.grisClair),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Pas de nouvelles alertes !')),
                      );
                    },
                  ),
                ],
              ),
              
              AppSpacing.h32,

              // 2. Carte de mise en avant : Quiz du Jour
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.sections),
                decoration: BoxDecoration(
                  color: AppColors.bleuPSG,
                  borderRadius: AppRadius.m,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.bleuPSG.withOpacity(0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.local_fire_department, color: AppColors.jauneXP),
                        AppSpacing.w8,
                        Text('QUIZ DU JOUR', style: AppTypography.h3),
                      ],
                    ),
                    AppSpacing.h8,
                    Text(
                      'Gagne +75 XP en répondant au défi quotidien !',
                      style: AppTypography.body.copyWith(color: AppColors.grisClair),
                    ),
                    AppSpacing.h16,
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Lancement du Quiz du Jour... ⏳')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.rougePSG,
                        foregroundColor: AppColors.blanc,
                      ),
                      child: const Text('JOUER MAINTENANT'),
                    ),
                  ],
                ),
              ),

              AppSpacing.h32,

              // 3. Section Entraînement / Catégories
              Text('ENTRAÎNEMENT', style: AppTypography.h3),
              AppSpacing.h16,
              
              SizedBox(
                width: double.infinity,
                height: 64,
                child: ElevatedButton.icon(
                  onPressed: () {
                    context.push(AppRoutes.categories);
                  },
                  icon: const Icon(Icons.sports_soccer, color: AppColors.blanc),
                  label: const Text('PARCOURIR LES CATÉGORIES'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.grisFonce,
                    foregroundColor: AppColors.blanc,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sections),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      
      // 4. Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.noirProfond,
        selectedItemColor: AppColors.rougePSG,
        unselectedItemColor: AppColors.grisClair,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0, // Onglet "Accueil" actif par défaut
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.sports_esports), label: 'Quiz'),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Classement'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
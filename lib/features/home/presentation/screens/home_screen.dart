import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/routes/app_router.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_radius.dart';
import '../../../../theme/app_spacing.dart';
import '../../../../theme/app_typography.dart';
import '../../../../shared/providers/player_provider.dart';
import '../../../../features/leaderboard/presentation/screens/leaderboard_screen.dart';
import '../../../../features/profile/presentation/screens/profile_screen.dart';

// 1. L'écran devient Stateful pour mémoriser l'onglet sélectionné
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // Par défaut, on est sur l'onglet 0 (Accueil)
  int _selectedIndex = 0;

  // Fonction déclenchée au clic sur un onglet du bas
  void _onItemTapped(int index) {
    if (index == 1) {
      // Si on clique sur "Quiz", on redirige directement vers l'écran des catégories existant
      context.push(AppRoutes.categories);
    } else {
      // Sinon, on met à jour l'onglet actif pour afficher la bonne page
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final player = ref.watch(playerProvider);

    // 2. Liste des différentes "vues" (pages) de la barre de navigation
    final List<Widget> pages = [
      _buildAccueilContent(context, player), // Index 0 : L'Accueil complet
      const SizedBox.shrink(),
      const LeaderboardScreen(), // Index 1 : Vide, car on navigue via GoRouter (Catégories)
      const ProfileScreen(), // On branche l'écran Profil !
    ];

    return Scaffold(
      backgroundColor: AppColors.noirProfond,
      // Le corps de la page change en fonction de l'onglet actif !
      body: SafeArea(
        child: pages[_selectedIndex], 
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.noirProfond,
        selectedItemColor: AppColors.rougePSG,
        unselectedItemColor: AppColors.grisClair,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.sports_esports), label: 'Quiz'),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Classement'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }

  // 3. Le contenu de l'accueil isolé ici pour plus de lisibilité
  Widget _buildAccueilContent(BuildContext context, PlayerProfile? player) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.sections),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Utilisateur
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
                    child: Text(player?.avatar ?? '⚽', style: const TextStyle(fontSize: 24)),
                  ),
                  AppSpacing.w16,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(player?.pseudo ?? 'Supporter', style: AppTypography.h3),
                      Text(
                        'Niveau ${player?.level ?? 1} • ${player?.xp ?? 0} XP',
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

          // Carte Quiz du Jour
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
                  'Gagne +25 XP en répondant au défi quotidien !',
                  style: AppTypography.body.copyWith(color: AppColors.grisClair),
                ),
                AppSpacing.h16,
                ElevatedButton(
                  onPressed: () {
                    context.push(AppRoutes.quiz, extra: 'Quiz du Jour');
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

          // Section Catégories
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
    );
  }
}
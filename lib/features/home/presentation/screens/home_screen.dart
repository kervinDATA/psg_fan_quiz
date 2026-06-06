import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 👈 NOUVEAU : Import pour utiliser le presse-papiers (Clipboard)
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
import '../../../../shared/components/xp_progress_bar.dart';
import '../../../../features/league/providers/league_providers.dart';
import '../../../../features/league/data/repositories/league_repository.dart';

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

  // 3. Le contenu du Vestiaire
  Widget _buildAccueilContent(BuildContext context, PlayerProfile? player) {
    // On écoute les données de la ligue en direct
    final leagueAsync = ref.watch(currentLeagueProvider);
    final membersAsync = ref.watch(leagueMembersProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.sections),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Utilisateur (On le garde, il est top !)
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(color: AppColors.grisFonce, shape: BoxShape.circle),
                child: Text(player?.avatar ?? '⚽', style: const TextStyle(fontSize: 24)),
              ),
              AppSpacing.w16,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(player?.pseudo ?? 'Supporter', style: AppTypography.h3),
                    AppSpacing.h8,
                    XpProgressBar(xp: player?.xp ?? 0, level: player?.level ?? 1),
                  ],
                ),
              ),
              AppSpacing.w16,
              IconButton(
                icon: const Icon(Icons.notifications_none, color: AppColors.grisClair),
                onPressed: () {},
              ),
            ],
          ),
          
          AppSpacing.h32,

          // SECTION : Infos de la Ligue et Bouton de Match
          leagueAsync.when(
            data: (league) {
              if (league == null) return const SizedBox.shrink();
              final currentDay = league['currentDay'] ?? 1;
              
              final isAdmin = league['adminId'] == player?.id; // On vérifie qui est le boss
              
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(league['name']?.toString().toUpperCase() ?? 'LIGUE', 
                        style: AppTypography.h2, overflow: TextOverflow.ellipsis),
                      ),
                      
                      // 🔴 NOUVEAU : Le badge est maintenant cliquable pour copier le code
                      GestureDetector(
                        onTap: () {
                          final code = player?.leagueId;
                          if (code != null) {
                            Clipboard.setData(ClipboardData(text: code));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Code $code copié ! Envoie-le à tes potes 📋', style: AppTypography.body.copyWith(color: AppColors.blanc, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                                backgroundColor: AppColors.vertSucces,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(borderRadius: AppRadius.m),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(color: AppColors.rougePSG, borderRadius: AppRadius.s),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('CODE: ${player?.leagueId}', style: AppTypography.caption.copyWith(fontWeight: FontWeight.bold, color: AppColors.blanc)),
                              AppSpacing.w4,
                              const Icon(Icons.copy, size: 14, color: AppColors.blanc),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.h16,

                  // Carte du Match
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(AppSpacing.sections),
                    decoration: BoxDecoration(color: AppColors.bleuPSG, borderRadius: AppRadius.m),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.sports_soccer, color: AppColors.jauneXP),
                            AppSpacing.w8,
                            Text('MATCH JOUR $currentDay / 3', style: AppTypography.h3),
                          ],
                        ),
                        AppSpacing.h8,
                        Text('Le défi du jour est prêt. Montre à tes potes qui est le patron !', style: AppTypography.body.copyWith(color: AppColors.grisClair)),
                        AppSpacing.h16,
                        
                        ElevatedButton(
                          onPressed: () {
                            final today = DateTime.now().toIso8601String().split('T')[0];
                            if (player?.lastDailyQuizDate == today) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Tu as déjà joué ton match ! Attends le coup d\'envoi demain ⏳', style: AppTypography.body.copyWith(color: AppColors.blanc, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                                  backgroundColor: AppColors.rougeErreur, behavior: SnackBarBehavior.floating, margin: const EdgeInsets.all(AppSpacing.sections), shape: RoundedRectangleBorder(borderRadius: AppRadius.m),
                                ),
                              );
                            } else {
                              context.push(AppRoutes.quiz, extra: 'Quiz du Jour');
                            }
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.rougePSG, foregroundColor: AppColors.blanc),
                          child: const Text('JOUER LE MATCH'),
                        ),
                      ],
                    ),
                  ),

                  // Zone Admin (Uniquement visible par le créateur)
                  if (isAdmin) ...[
                    AppSpacing.h16,
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () async {
                          // On lance le script de clôture de saison !
                          await ref.read(leagueRepositoryProvider).closeSeasonAndStartNext(player!.leagueId!);
                          
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Saison clôturée ! Les compteurs sont remis à zéro 🔄', style: AppTypography.body.copyWith(color: AppColors.blanc)),
                                backgroundColor: AppColors.vertSucces,
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          }
                        },
                        icon: const Icon(Icons.emoji_events, color: AppColors.jauneXP),
                        label: const Text('CLÔTURER LA SAISON (ADMIN)'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.jauneXP,
                          side: const BorderSide(color: AppColors.jauneXP),
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(borderRadius: AppRadius.m),
                        ),
                      ),
                    ),
                  ],
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator(color: AppColors.rougePSG)),
            error: (e, s) => const Text('Erreur de chargement de la ligue.', style: TextStyle(color: AppColors.rougeErreur)),
          ),

          AppSpacing.h32,
          Text('CLASSEMENT DU GROUPE', style: AppTypography.h3),
          AppSpacing.h16,

          // SECTION : Le Classement en direct
          membersAsync.when(
            data: (members) {
              if (members.isEmpty) return const Text('Aucun joueur...');
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // Empêche le double-scroll
                itemCount: members.length,
                itemBuilder: (context, index) {
                  final member = members[index];
                  final isMe = member['pseudo'] == player?.pseudo; // On met en surbrillance l'utilisateur actuel
                  
                  return Card(
                    color: isMe ? AppColors.rougePSG.withOpacity(0.15) : AppColors.grisFonce,
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: isMe ? AppColors.rougePSG : Colors.transparent, width: 2),
                      borderRadius: AppRadius.m,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: isMe ? AppColors.rougePSG : Colors.white24, 
                        child: Text('${index + 1}', style: const TextStyle(color: AppColors.blanc, fontWeight: FontWeight.bold)),
                      ),
                      title: Text('${member['avatar']} ${member['pseudo']}', style: AppTypography.body.copyWith(fontWeight: FontWeight.bold)),
                      
                      trailing: Text('${member['leagueScore'] ?? 0} PTS', style: AppTypography.body.copyWith(color: AppColors.jauneXP, fontWeight: FontWeight.bold)),
                    ),
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator(color: AppColors.rougePSG)),
            error: (e, s) => const Text('Erreur du classement.', style: TextStyle(color: AppColors.rougeErreur)),
          ),
        ],
      ),
    );
  }
}
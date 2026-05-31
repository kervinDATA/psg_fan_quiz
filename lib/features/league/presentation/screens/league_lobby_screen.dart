import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/routes/app_router.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_spacing.dart';
import '../../../../theme/app_typography.dart';
import '../../../../theme/app_radius.dart';
import '../../data/repositories/league_repository.dart';
import '../../../../shared/providers/player_provider.dart';

class LeagueLobbyScreen extends ConsumerStatefulWidget {
  const LeagueLobbyScreen({super.key});

  @override
  ConsumerState<LeagueLobbyScreen> createState() => _LeagueLobbyScreenState();
}

class _LeagueLobbyScreenState extends ConsumerState<LeagueLobbyScreen> {
  bool _isLoading = false;

  // 1. Popup pour Créer une Ligue
  void _showCreateLeagueDialog() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.grisFonce,
        title: Text('Créer une Ligue', style: AppTypography.h3.copyWith(color: AppColors.blanc)),
        content: TextField(
          controller: controller,
          style: const TextStyle(color: AppColors.blanc),
          decoration: InputDecoration(
            hintText: 'Nom de la ligue (ex: Les Titis)',
            hintStyle: const TextStyle(color: AppColors.grisClair),
            filled: true,
            fillColor: AppColors.noirProfond,
            border: OutlineInputBorder(borderRadius: AppRadius.m, borderSide: BorderSide.none),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('ANNULER', style: TextStyle(color: AppColors.grisClair)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.rougePSG),
            onPressed: () async {
              if (controller.text.trim().isEmpty) return;
              Navigator.pop(context); // Ferme la popup
              await _createLeague(controller.text.trim());
            },
            child: const Text('CRÉER', style: TextStyle(color: AppColors.blanc)),
          ),
        ],
      ),
    );
  }

  // 2. Popup pour Rejoindre une Ligue
  void _showJoinLeagueDialog() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.grisFonce,
        title: Text('Rejoindre une Ligue', style: AppTypography.h3.copyWith(color: AppColors.blanc)),
        content: TextField(
          controller: controller,
          style: const TextStyle(color: AppColors.blanc),
          maxLength: 6, // Bloque à 6 lettres !
          textCapitalization: TextCapitalization.characters,
          decoration: InputDecoration(
            hintText: 'Code secret (ex: A7B9X2)',
            hintStyle: const TextStyle(color: AppColors.grisClair),
            filled: true,
            fillColor: AppColors.noirProfond,
            border: OutlineInputBorder(borderRadius: AppRadius.m, borderSide: BorderSide.none),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('ANNULER', style: TextStyle(color: AppColors.grisClair)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.bleuPSG),
            onPressed: () async {
              if (controller.text.trim().length != 6) return;
              Navigator.pop(context);
              await _joinLeague(controller.text.trim());
            },
            child: const Text('REJOINDRE', style: TextStyle(color: AppColors.blanc)),
          ),
        ],
      ),
    );
  }

  // Logique de Création branchée à Firestore
  Future<void> _createLeague(String name) async {
    setState(() => _isLoading = true);
    final player = ref.read(playerProvider);
    if (player == null) return;

    try {
      final code = await ref.read(leagueRepositoryProvider).createLeague(name, player.id);
      await ref.read(playerProvider.notifier).setLeagueId(code); 
      if (mounted) context.go(AppRoutes.home); // Bientôt, ce sera le Dashboard de la Ligue !
    } catch (e) {
      print(e);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  // Logique de Connexion branchée à Firestore
  Future<void> _joinLeague(String code) async {
    setState(() => _isLoading = true);
    final player = ref.read(playerProvider);
    if (player == null) return;

    try {
      final success = await ref.read(leagueRepositoryProvider).joinLeague(code, player.id);
      if (success) {
        await ref.read(playerProvider.notifier).setLeagueId(code);
        if (mounted) context.go(AppRoutes.home);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Code invalide ou ligue introuvable !'), backgroundColor: AppColors.rougeErreur),
          );
        }
      }
    } catch (e) {
      print(e);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.noirProfond,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Le Vestiaire', style: AppTypography.h3),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.sections),
          child: _isLoading 
            ? const Center(child: CircularProgressIndicator(color: AppColors.rougePSG))
            : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Carte CRÉER
              _buildActionCard(
                title: 'CRÉER UNE LIGUE',
                subtitle: 'Deviens l\'admin et invite tes potes.',
                icon: Icons.add_circle_outline,
                color: AppColors.rougePSG,
                onTap: _showCreateLeagueDialog,
              ),
              AppSpacing.h32,
              
              // Carte REJOINDRE
              _buildActionCard(
                title: 'REJOINDRE UNE LIGUE',
                subtitle: 'Tu as un code secret à 6 lettres ?',
                icon: Icons.group_add_outlined,
                color: AppColors.bleuPSG,
                onTap: _showJoinLeagueDialog,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Petit widget réutilisable pour de belles cartes cliquables
  Widget _buildActionCard({required String title, required String subtitle, required IconData icon, required Color color, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.m,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.sections),
        decoration: BoxDecoration(
          color: AppColors.grisFonce,
          borderRadius: AppRadius.m,
          border: Border.all(color: color, width: 2),
        ),
        child: Column(
          children: [
            Icon(icon, size: 48, color: color),
            AppSpacing.h16,
            Text(title, style: AppTypography.h2.copyWith(color: AppColors.blanc)),
            AppSpacing.h8,
            Text(subtitle, style: AppTypography.body.copyWith(color: AppColors.grisClair), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
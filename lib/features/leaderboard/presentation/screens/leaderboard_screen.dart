import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/leaderboard_provider.dart';

/// Écran principal du classement (Leaderboard)
class LeaderboardScreen extends ConsumerWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // On écoute notre provider en temps réel
    final leaderboardAsyncValue = ref.watch(leaderboardProvider);

    return Scaffold(
      // Bleu PSG en background
      backgroundColor: const Color(0xFF0A1E5E), 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Classement Mondial',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins', // Typographie officielle
          ),
        ),
        centerTitle: true,
      ),
      // Gestion des états avec Riverpod (data, loading, error)
      body: leaderboardAsyncValue.when(
        data: (players) {
          if (players.isEmpty) {
            return const Center(
              child: Text(
                'Aucun joueur classé pour le moment.',
                style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: players.length,
            itemBuilder: (context, index) {
              final player = players[index];
              final isTop3 = index < 3;

              return Card(
                // Rouge PSG pour le podium, Gris foncé pour les autres[cite: 7]
                color: isTop3 ? const Color(0xFFD00027) : const Color(0xFF1F2937),
                margin: const EdgeInsets.only(bottom: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0), // Medium radius[cite: 7]
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white24,
                    child: Text(
                      '#${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(
                    player['pseudo'] ?? 'Anonyme',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  subtitle: Text(
                    'Niveau ${player['level'] ?? 1}',
                    style: const TextStyle(color: Colors.white70, fontFamily: 'Poppins'),
                  ),
                  trailing: Text(
                    '${player['xp'] ?? 0} XP',
                    style: const TextStyle(
                      color: Color(0xFFFACC15), // Jaune XP[cite: 7]
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: Color(0xFFD00027)), // Loader Rouge PSG[cite: 7]
        ),
        error: (error, stackTrace) => const Center(
          child: Text(
            'Erreur lors du chargement du classement.',
            style: TextStyle(color: Color(0xFFEF4444)), // Rouge erreur[cite: 7]
          ),
        ),
      ),
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/providers/player_provider.dart';

// 1. Écoute le document de la Ligue actuelle
final currentLeagueProvider = StreamProvider.autoDispose<Map<String, dynamic>?>((ref) {
  final player = ref.watch(playerProvider);
  if (player?.leagueId == null) return const Stream.empty();

  return FirebaseFirestore.instance
      .collection('leagues')
      .doc(player!.leagueId)
      .snapshots()
      .map((doc) => doc.data());
});

// 2. Écoute tous les membres de cette ligue et les trie par XP
final leagueMembersProvider = StreamProvider.autoDispose<List<Map<String, dynamic>>>((ref) {
  final player = ref.watch(playerProvider);
  if (player?.leagueId == null) return const Stream.empty();

  return FirebaseFirestore.instance
      .collection('users')
      .where('leagueId', isEqualTo: player!.leagueId)
      .snapshots()
      .map((snapshot) {
        // On récupère les profils
        final members = snapshot.docs.map((doc) => doc.data()).toList();
        // On les trie du plus grand XP au plus petit directement dans l'application
        members.sort((a, b) => (b['leagueScore'] as int? ?? 0).compareTo(a['leagueScore'] as int? ?? 0));
        return members;
      });
});
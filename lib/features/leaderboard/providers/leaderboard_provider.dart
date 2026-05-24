import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider qui écoute la collection 'users' en temps réel, 
/// triée par XP décroissant pour générer le leaderboard.
final leaderboardProvider = StreamProvider.autoDispose<List<Map<String, dynamic>>>((ref) {
  final firestore = FirebaseFirestore.instance;

  // On interroge la collection "users"
  return firestore
      .collection('users')
      // On trie par le champ 'xp' du plus grand au plus petit
      .orderBy('xp', descending: true)
      // On limite aux 10 premiers pour un Top 10 mondial (optimisation)
      .limit(10)
      .snapshots()
      .map((snapshot) {
        // On transforme les documents Firestore en liste de Maps exploitables par l'UI
        return snapshot.docs.map((doc) {
          final data = doc.data();
          data['id'] = doc.id; // On conserve l'ID du document si besoin
          return data;
        }).toList();
      });
});
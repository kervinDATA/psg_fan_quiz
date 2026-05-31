import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// 1. Le Modèle de données
class PlayerProfile {
  final String id;
  final String pseudo;
  final String avatar;
  final int level;
  final int xp;
  final String? lastDailyQuizDate;
  final String? leagueId; // 👈 NOUVEAU : La ligue du joueur
  final int leagueScore; // 👈 NOUVEAU : Le score de la saison en cours

  PlayerProfile({
    required this.id,
    required this.pseudo,
    required this.avatar,
    this.level = 1,
    this.xp = 0,
    this.lastDailyQuizDate,
    this.leagueId, // 👈 NOUVEAU
    this.leagueScore = 0, // 👈 NOUVEAU
  });

  PlayerProfile copyWith({
    String? id,
    String? pseudo,
    String? avatar,
    int? level,
    int? xp,
    String? lastDailyQuizDate,
    String? leagueId, // 👈 NOUVEAU
    int? leagueScore, // 👈 NOUVEAU
  }) {
    return PlayerProfile(
      id: id ?? this.id,
      pseudo: pseudo ?? this.pseudo,
      avatar: avatar ?? this.avatar,
      level: level ?? this.level,
      xp: xp ?? this.xp,
      lastDailyQuizDate: lastDailyQuizDate ?? this.lastDailyQuizDate,
      leagueId: leagueId ?? this.leagueId, // 👈 NOUVEAU
      leagueScore: leagueScore ?? this.leagueScore, // 👈 NOUVEAU
    );
  }
}

// 2. Le Notifier
class PlayerNotifier extends Notifier<PlayerProfile?> {
  final _db = FirebaseFirestore.instance;

  @override
  PlayerProfile? build() {
    return null;
  }

  Future<bool> loadProfile(String uid) async {
    try {
      final doc = await _db.collection('users').doc(uid).get();
      if (doc.exists && doc.data() != null) {
        final data = doc.data()!;
        state = PlayerProfile(
          id: doc.id,
          pseudo: data['pseudo'] ?? 'Supporter',
          avatar: data['avatar'] ?? '⚽',
          level: data['level'] ?? 1,
          xp: data['xp'] ?? 0,
          lastDailyQuizDate: data['lastDailyQuizDate'],
          leagueId: data['leagueId'], // 👈 NOUVEAU
          leagueScore: data['leagueScore'] ?? 0, // 👈 NOUVEAU
        );
        return true;
      }
    } catch (e) {
      print("Erreur de chargement: $e");
    }
    return false;
  }

  Future<void> createProfile(String pseudo, String avatar, String uid) async {
    final data = {
      'pseudo': pseudo,
      'avatar': avatar,
      'level': 1,
      'xp': 0,
      'lastDailyQuizDate': null, // 👈 NOUVEAU
      'createdAt': FieldValue.serverTimestamp(),
    };
    await _db.collection('users').doc(uid).set(data);
    state = PlayerProfile(
      id: uid,
      pseudo: pseudo,
      avatar: avatar,
      level: 1,
      xp: 0,
    );
  }

  // 🔴 NOUVEAU : On ajoute l'XP globale ET le score de la Ligue !
  void addMatchScore(int score) {
    if (state == null) return;
    
    final newXp = state!.xp + score;
    final newLevel = 1 + (newXp ~/ 100);
    final newLeagueScore = state!.leagueScore + score; // 👈 On monte le score de la ligue

    _db.collection('users').doc(state!.id).update({
      'xp': newXp,
      'level': newLevel,
      'leagueScore': newLeagueScore, // 👈 On sauvegarde dans le cloud
    });

    state = state!.copyWith(
      xp: newXp, 
      level: newLevel, 
      leagueScore: newLeagueScore
    );
  }

  // 🔴 NOUVEAU : Marquer le quiz comme joué aujourd'hui
  void markDailyQuizAsPlayed() {
    if (state == null) return;
    // On génère la date du jour au format YYYY-MM-DD
    final today = DateTime.now().toIso8601String().split('T')[0];
    
    _db.collection('users').doc(state!.id).update({
      'lastDailyQuizDate': today,
    });
    state = state!.copyWith(lastDailyQuizDate: today);
  }

  // 🔴 NOUVEAU : Lier le joueur à sa ligue dans Firestore
  Future<void> setLeagueId(String leagueId) async {
    if (state == null) return;
    await _db.collection('users').doc(state!.id).update({'leagueId': leagueId});
    state = state!.copyWith(leagueId: leagueId);
  }
}

final playerProvider = NotifierProvider<PlayerNotifier, PlayerProfile?>(() {
  return PlayerNotifier();
});
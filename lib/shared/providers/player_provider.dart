import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// 1. Le Modèle de données
class PlayerProfile {
  final String id;
  final String pseudo;
  final String avatar;
  final int level;
  final int xp;
  final String? lastDailyQuizDate; // 👈 NOUVEAU

  PlayerProfile({
    required this.id,
    required this.pseudo,
    required this.avatar,
    this.level = 1,
    this.xp = 0,
    this.lastDailyQuizDate,
  });

  PlayerProfile copyWith({
    String? id,
    String? pseudo,
    String? avatar,
    int? level,
    int? xp,
    String? lastDailyQuizDate,
  }) {
    return PlayerProfile(
      id: id ?? this.id,
      pseudo: pseudo ?? this.pseudo,
      avatar: avatar ?? this.avatar,
      level: level ?? this.level,
      xp: xp ?? this.xp,
      lastDailyQuizDate: lastDailyQuizDate ?? this.lastDailyQuizDate,
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
          lastDailyQuizDate: data['lastDailyQuizDate'], // 👈 NOUVEAU
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

  void addXp(int earnedXp) {
    if (state == null) return;
    final newXp = state!.xp + earnedXp;
    final newLevel = 1 + (newXp ~/ 100);
    _db.collection('users').doc(state!.id).update({
      'xp': newXp,
      'level': newLevel,
    });
    state = state!.copyWith(xp: newXp, level: newLevel);
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
}

final playerProvider = NotifierProvider<PlayerNotifier, PlayerProfile?>(() {
  return PlayerNotifier();
});
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// 1. Le Modèle de données (Inchangé)
class PlayerProfile {
  final String id;
  final String pseudo;
  final String avatar;
  final int level;
  final int xp;

  PlayerProfile({
    required this.id,
    required this.pseudo,
    required this.avatar,
    this.level = 1,
    this.xp = 0,
  });

  PlayerProfile copyWith({
    String? id,
    String? pseudo,
    String? avatar,
    int? level,
    int? xp,
  }) {
    return PlayerProfile(
      id: id ?? this.id,
      pseudo: pseudo ?? this.pseudo,
      avatar: avatar ?? this.avatar,
      level: level ?? this.level,
      xp: xp ?? this.xp,
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

  // 🔴 NOUVEAU : Fonction pour charger un profil existant au démarrage
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
        );
        return true; // Profil trouvé et chargé !
      }
    } catch (e) {
      print("Erreur de chargement du profil: $e");
    }
    return false; // Aucun profil trouvé
  }

  // 🔴 MODIFIÉ : On utilise l'UID d'authentification pour cibler le document avec .set()
  Future<void> createProfile(String pseudo, String avatar, String uid) async {
    final data = {
      'pseudo': pseudo,
      'avatar': avatar,
      'level': 1,
      'xp': 0,
      'createdAt': FieldValue.serverTimestamp(),
    };

    // On force l'ID du document à être l'ID de connexion du téléphone
    await _db.collection('users').doc(uid).set(data);

    state = PlayerProfile(
      id: uid,
      pseudo: pseudo,
      avatar: avatar,
      level: 1,
      xp: 0,
    );
  }

  // Ajout de l'XP (Inchangé)
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
}

// 3. Le Provider (Inchangé)
final playerProvider = NotifierProvider<PlayerNotifier, PlayerProfile?>(() {
  return PlayerNotifier();
});
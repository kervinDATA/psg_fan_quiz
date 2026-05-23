import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // 👈 Le nouvel import

// 1. Le Modèle de données (on lui ajoute un ID unique)
class PlayerProfile {
  final String id; // 🔴 NOUVEAU : L'identifiant secret du document dans le cloud
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

// 2. Le Notifier (Le cerveau qui parle maintenant au Cloud)
class PlayerNotifier extends Notifier<PlayerProfile?> {
  // Instance de la base de données
  final _db = FirebaseFirestore.instance;

  @override
  PlayerProfile? build() {
    return null; 
  }

  // 🔴 NOUVEAU : On utilise 'async' pour attendre que Google réponde
  Future<void> createProfile(String pseudo, String avatar) async {
    // 1. On prépare le petit colis de données pour Firestore
    final data = {
      'pseudo': pseudo,
      'avatar': avatar,
      'level': 1,
      'xp': 0,
      'createdAt': FieldValue.serverTimestamp(), // Date exacte du serveur
    };

    // 2. On envoie le colis dans la collection 'users', Google nous renvoie le document créé
    final docRef = await _db.collection('users').add(data);

    // 3. On met à jour l'écran avec l'ID généré !
    state = PlayerProfile(
      id: docRef.id,
      pseudo: pseudo,
      avatar: avatar,
      level: 1,
      xp: 0,
    );
  }

  // 🔴 NOUVEAU : Mise à jour de l'XP dans les nuages
  void addXp(int earnedXp) {
    if (state == null) return; 

    final newXp = state!.xp + earnedXp;
    final newLevel = 1 + (newXp ~/ 100); 

    // 1. On dit à Firestore de mettre à jour uniquement l'XP et le Niveau de ce joueur
    _db.collection('users').doc(state!.id).update({
      'xp': newXp,
      'level': newLevel,
    });

    // 2. On met à jour l'écran visuellement
    state = state!.copyWith(xp: newXp, level: newLevel);
  }
}

// 3. Le Provider
final playerProvider = NotifierProvider<PlayerNotifier, PlayerProfile?>(() {
  return PlayerNotifier();
});
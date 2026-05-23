import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. Le Modèle de données
class PlayerProfile {
  final String pseudo;
  final String avatar;
  final int level;
  final int xp;

  PlayerProfile({
    required this.pseudo,
    required this.avatar,
    this.level = 1,
    this.xp = 0,
  });

  // Méthode indispensable avec Riverpod pour mettre à jour une seule valeur (ex: l'XP) 
  // sans effacer le reste (pseudo, avatar)
  PlayerProfile copyWith({
    String? pseudo,
    String? avatar,
    int? level,
    int? xp,
  }) {
    return PlayerProfile(
      pseudo: pseudo ?? this.pseudo,
      avatar: avatar ?? this.avatar,
      level: level ?? this.level,
      xp: xp ?? this.xp,
    );
  }
}

// 2. Le Notifier (Le cerveau)
class PlayerNotifier extends Notifier<PlayerProfile?> {
  @override
  PlayerProfile? build() {
    return null; 
  }

  void createProfile(String pseudo, String avatar) {
    state = PlayerProfile(
      pseudo: pseudo,
      avatar: avatar,
      level: 1,
      xp: 0,
    );
  }

  // 🔴 NOUVEAU : La méthode qui ajoute l'XP et gère la montée en niveau
  void addXp(int earnedXp) {
    if (state == null) return; // Sécurité si aucun joueur n'est connecté

    final newXp = state!.xp + earnedXp;
    
    // Logique de leveling automatique : 1 Niveau tous les 100 XP
    final newLevel = 1 + (newXp ~/ 100); 

    // On remplace l'ancien état par le nouveau, mis à jour
    state = state!.copyWith(xp: newXp, level: newLevel);
  }
}

// 3. Le Provider
final playerProvider = NotifierProvider<PlayerNotifier, PlayerProfile?>(() {
  return PlayerNotifier();
});
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. Le Modèle de données (Ce qu'est un profil joueur)
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
}

// 2. Le Notifier (Le cerveau qui gère l'état du profil)
class PlayerNotifier extends Notifier<PlayerProfile?> {
  @override
  PlayerProfile? build() {
    // Au lancement, il n'y a pas encore de profil en mémoire
    return null; 
  }

  // Fonction pour sauvegarder le profil lors de la création
  void createProfile(String pseudo, String avatar) {
    state = PlayerProfile(
      pseudo: pseudo,
      avatar: avatar,
      level: 1,
      xp: 0,
    );
  }
}

// 3. Le Provider (Le point d'accès global que nos écrans vont écouter)
final playerProvider = NotifierProvider<PlayerNotifier, PlayerProfile?>(() {
  return PlayerNotifier();
});
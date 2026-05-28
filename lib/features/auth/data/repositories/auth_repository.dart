import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Repository chargé de l'authentification des joueurs
class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Connecte l'utilisateur de manière silencieuse et invisible
  Future<User?> signInAnonymously() async {
    try {
      final userCredential = await _auth.signInAnonymously();
      return userCredential.user;
    } catch (e) {
      print("Erreur d'authentification anonyme : $e");
      return null;
    }
  }

  /// Permet de vérifier si un joueur est déjà connecté sur ce téléphone
  User? get currentUser => _auth.currentUser;
}

// Le Provider pour rendre ce service accessible via Riverpod
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});
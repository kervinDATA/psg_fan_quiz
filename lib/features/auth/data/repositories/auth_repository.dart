import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // 🔴 NOUVEAU : Inscription
  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      print("Erreur d'inscription : $e");
      throw e; // On renvoie l'erreur pour l'afficher dans l'UI
    }
  }

  // 🔴 NOUVEAU : Connexion
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      print("Erreur de connexion : $e");
      throw e;
    }
  }

  // 🔴 NOUVEAU : Déconnexion
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // L'utilisateur actuellement connecté
  User? get currentUser => _auth.currentUser;
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeagueRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 1. Générateur de code secret (6 caractères, lettres et chiffres)
  String _generateLeagueCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    return String.fromCharCodes(Iterable.generate(
      6, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
  }

  // 2. Créer une nouvelle Ligue dans le Cloud
  Future<String> createLeague(String name, String userId) async {
    String code = _generateLeagueCode();
    
    final leagueData = {
      'name': name,
      'adminId': userId,
      'members': [userId], // Le créateur est automatiquement le 1er membre
      'currentDay': 1,
      'createdAt': FieldValue.serverTimestamp(),
    };

    // On utilise le code secret comme ID du document dans Firestore
    await _firestore.collection('leagues').doc(code).set(leagueData);
    
    return code; // On renvoie le code pour l'afficher à l'écran
  }

  // 3. Rejoindre une ligue existante avec un code
  Future<bool> joinLeague(String code, String userId) async {
    // On met en majuscules pour éviter les erreurs de frappe
    final cleanCode = code.trim().toUpperCase(); 
    final docRef = _firestore.collection('leagues').doc(cleanCode);
    final docSnap = await docRef.get();

    if (docSnap.exists) {
      // Magie Firestore : arrayUnion ajoute l'utilisateur sans écraser les copains !
      await docRef.update({
        'members': FieldValue.arrayUnion([userId])
      });
      return true; // Succès
    }
    return false; // Échec : le code n'existe pas
  }

  // 4. Clôturer la saison et relancer (Version pure, sans bonus)
  Future<void> closeSeasonAndStartNext(String leagueId) async {
    try {
      // 1. On récupère tous les membres de la ligue
      final membersSnap = await _firestore
          .collection('users')
          .where('leagueId', isEqualTo: leagueId)
          .get();

      if (membersSnap.docs.isEmpty) return;

      // 2. On prépare un Batch (pour tout écrire d'un seul coup)
      final batch = _firestore.batch();

      // 3. On remet les scores de ligue de TOUT LE MONDE à 0
      for (var doc in membersSnap.docs) {
        batch.update(doc.reference, {'leagueScore': 0});
      }

      // 4. On remet le jour de la ligue à 1
      final leagueRef = _firestore.collection('leagues').doc(leagueId);
      batch.update(leagueRef, {'currentDay': 1});

      // 5. On exécute toutes ces actions simultanément sur Firebase !
      await batch.commit();

      print("✅ Saison clôturée ! Les scores de la ligue sont remis à zéro.");
      
    } catch (e) {
      print("🚨 Erreur lors de la clôture de la saison : $e");
    }
  }
}

// Le Provider pour rendre ce moteur accessible partout dans l'application
final leagueRepositoryProvider = Provider<LeagueRepository>((ref) {
  return LeagueRepository();
});
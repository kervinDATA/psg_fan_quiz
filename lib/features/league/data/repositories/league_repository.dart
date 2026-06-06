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
    final today = DateTime.now().toIso8601String().split('T')[0]; // 👈 Date du jour
    
    final leagueData = {
      'name': name,
      'adminId': userId,
      'members': [userId], // Le créateur est automatiquement le 1er membre
      'currentDay': 1,
      'lastDayUpdate': today, // 🔴 NOUVEAU : On enregistre la date du Jour 1
      'createdAt': FieldValue.serverTimestamp(),
    };

    await _firestore.collection('leagues').doc(code).set(leagueData);
    return code; 
  }

  // 3. Rejoindre une ligue existante avec un code
  Future<bool> joinLeague(String code, String userId) async {
    final cleanCode = code.trim().toUpperCase(); 
    final docRef = _firestore.collection('leagues').doc(cleanCode);
    final docSnap = await docRef.get();

    if (docSnap.exists) {
      await docRef.update({
        'members': FieldValue.arrayUnion([userId])
      });
      return true; 
    }
    return false; 
  }

  // 4. Clôturer la saison et relancer
  Future<void> closeSeasonAndStartNext(String leagueId) async {
    try {
      final membersSnap = await _firestore.collection('users').where('leagueId', isEqualTo: leagueId).get();
      if (membersSnap.docs.isEmpty) return;

      final batch = _firestore.batch();

      for (var doc in membersSnap.docs) {
        batch.update(doc.reference, {'leagueScore': 0});
      }

      final today = DateTime.now().toIso8601String().split('T')[0]; // 👈 Date du jour
      final leagueRef = _firestore.collection('leagues').doc(leagueId);
      
      // 🔴 NOUVEAU : On repart au Jour 1, à la date d'aujourd'hui
      batch.update(leagueRef, {
        'currentDay': 1,
        'lastDayUpdate': today 
      });

      await batch.commit();
      print("✅ Saison clôturée ! Les scores de la ligue sont remis à zéro.");
    } catch (e) {
      print("🚨 Erreur lors de la clôture de la saison : $e");
    }
  }

  // 5. 🔴 NOUVEAU : Avancer le jour de la ligue si un nouveau jour se lève !
  Future<void> advanceLeagueDay(String leagueId) async {
    try {
      final docRef = _firestore.collection('leagues').doc(leagueId);
      final docSnap = await docRef.get();
      if (!docSnap.exists) return;

      final data = docSnap.data()!;
      final currentDay = data['currentDay'] as int? ?? 1;
      final lastDayUpdate = data['lastDayUpdate'] as String?;
      final today = DateTime.now().toIso8601String().split('T')[0];

      // Si la date enregistrée n'est pas celle d'aujourd'hui ET qu'on n'a pas fini le championnat (Jour 3)
      if (lastDayUpdate != today && currentDay < 3) {
        await docRef.update({
          'currentDay': currentDay + 1,
          'lastDayUpdate': today,
        });
        print("📅 La ligue passe au jour ${currentDay + 1} !");
      }
    } catch (e) {
      print("🚨 Erreur lors de la mise à jour du jour de la ligue : $e");
    }
  }
}

final leagueRepositoryProvider = Provider<LeagueRepository>((ref) {
  return LeagueRepository();
});
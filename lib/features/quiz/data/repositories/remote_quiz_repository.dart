import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/question.dart';

/// Repository qui gère la récupération des questions depuis Firebase
class RemoteQuizRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Question>> getQuestionsForCategory(String category) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot;

      if (category == 'Quiz du Jour') {
        // Pour le Quiz du Jour, on récupère toutes les questions de la base
        snapshot = await _firestore.collection('questions').get();
      } else {
        // Sinon, on filtre normalement par catégorie
        snapshot = await _firestore
            .collection('questions')
            .where('categoryId', isEqualTo: category)
            .get();
      }

      var questionsList = snapshot.docs.map((doc) {
        final data = doc.data();
        return Question(
          id: doc.id,
          text: data['text'] ?? 'Question introuvable',
          options: List<String>.from(data['options'] ?? []),
          correctAnswerIndex: data['correctAnswerIndex'] ?? 0,
          explanation: data['explanation'] ?? '',
        );
      }).toList();

      // Sécurité si la base de données est vide
      if (questionsList.isEmpty) return [];

      // 🔴 NOUVEAU : Logique de "Fenêtre Glissante" pour 0 doublon !
      if (category == 'Quiz du Jour') {
        // 1. On mélange avec une graine FIXE (ex: 75 pour Paris). 
        // L'ordre du "paquet de cartes" sera toujours exactement le même.
        questionsList.shuffle(Random(75));
        
        // 2. On calcule le nombre de jours écoulés depuis une date de référence
        final now = DateTime.now();
        final daysSinceEpoch = now.difference(DateTime(2024, 1, 1)).inDays;
        
        // 3. On choisit le nombre de questions par jour 
        // (Tu as parlé de 10 questions/jour, je mets 3 pour l'instant pour tes tests, mais tu pourras changer ce chiffre !)
        const questionsPerDay = 3; 
        
        // Sécurité au cas où il y a moins de questions dans la BDD que le quota demandé
        final count = min(questionsPerDay, questionsList.length);
        
        // 4. On calcule l'index de départ pour aujourd'hui
        // Le modulo (%) permet de revenir au début de la liste si on a épuisé toutes les questions de la base !
        final startIndex = (daysSinceEpoch * count) % questionsList.length;
        
        // 5. On extrait la tranche du jour
        final dailyQuestions = <Question>[];
        for (int i = 0; i < count; i++) {
          dailyQuestions.add(questionsList[(startIndex + i) % questionsList.length]);
        }
        
        questionsList = dailyQuestions;
      }

      return questionsList;
    } catch (e) {
      print("Erreur: $e");
      return [];
    }
  }
}

// Le Provider pour injecter ce nouveau repository dans notre application
final remoteQuizRepositoryProvider = Provider<RemoteQuizRepository>((ref) {
  return RemoteQuizRepository();
});
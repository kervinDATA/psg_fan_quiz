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

      // 🔴 NOUVEAU : Si c'est le quiz du jour, on mélange le tout et on garde 3 questions au hasard
      if (category == 'Quiz du Jour') {
        questionsList.shuffle();
        if (questionsList.length > 3) {
          questionsList = questionsList.sublist(0, 3);
        }
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
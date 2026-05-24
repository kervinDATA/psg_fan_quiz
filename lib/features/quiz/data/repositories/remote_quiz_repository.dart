import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/question.dart';

/// Repository qui gère la récupération des questions depuis Firebase
class RemoteQuizRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Question>> getQuestionsForCategory(String category) async {
    try {
      // On interroge Firestore pour récupérer les questions de la bonne catégorie
      final snapshot = await _firestore
          .collection('questions')
          .where('categoryId', isEqualTo: category)
          .get();

      // On transforme les documents bruts en objets "Question" pour notre application
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Question(
          id: doc.id,
          text: data['text'] ?? 'Question introuvable',
          // On convertit proprement le tableau dynamique en List<String>
          options: List<String>.from(data['options'] ?? []),
          correctAnswerIndex: data['correctAnswerIndex'] ?? 0,
          explanation: data['explanation'] ?? '',
        );
      }).toList();
    } catch (e) {
      print("Erreur lors de la récupération des questions: $e");
      return [];
    }
  }
}

// Le Provider pour injecter ce nouveau repository dans notre application
final remoteQuizRepositoryProvider = Provider<RemoteQuizRepository>((ref) {
  return RemoteQuizRepository();
});
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Repository chargé de sauvegarder l'historique des parties dans Firestore
class QuizResultRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveResult({
    required String userId,
    required String categoryId,
    required int score,
    required int correctAnswers,
    required int totalQuestions,
  }) async {
    try {
      // On prépare la feuille de match selon le modèle de données V1
      final resultData = {
        'userId': userId,
        'categoryId': categoryId,
        'score': score,
        'correctAnswers': correctAnswers,
        'wrongAnswers': totalQuestions - correctAnswers,
        'totalQuestions': totalQuestions,
        'completed': true,
        'createdAt': FieldValue.serverTimestamp(),
      };

      // On envoie le tout dans la collection 'quiz_results'
      await _firestore.collection('quiz_results').add(resultData);
      
    } catch (e) {
      print("Erreur lors de la sauvegarde du résultat: $e");
    }
  }
}

// Le Provider pour rendre ce service accessible partout via Riverpod
final quizResultRepositoryProvider = Provider<QuizResultRepository>((ref) {
  return QuizResultRepository();
});
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/question.dart';

class MockQuizRepository {
  // Une petite liste de questions pour la catégorie "Légendes"
  List<Question> getQuestionsForCategory(String category) {
    if (category == 'Légendes') {
      return [
        Question(
          id: 'q1',
          text: 'Quel joueur détient le record de buts marqués avec le PSG ?',
          options: ['Zlatan Ibrahimović', 'Edinson Cavani', 'Kylian Mbappé', 'Pauleta'],
          correctAnswerIndex: 2,
          explanation: 'Kylian Mbappé a dépassé Edinson Cavani en 2023 pour devenir le meilleur buteur absolu du club !',
        ),
        Question(
          id: 'q2',
          text: 'Qui était surnommé "Le Magicien" au Parc des Princes dans les années 90 ?',
          options: ['George Weah', 'David Ginola', 'Jay-Jay Okocha', 'Safet Sušić'],
          correctAnswerIndex: 3,
          explanation: 'Safet Sušić, véritable légende du club, était reconnu pour sa vista et ses dribbles hors du commun.',
        ),
        Question(
          id: 'q3',
          text: 'En quelle année Raí a-t-il rejoint le Paris Saint-Germain ?',
          options: ['1991', '1993', '1995', '1998'],
          correctAnswerIndex: 1,
          explanation: 'Raí est arrivé en 1993 en provenance de São Paulo et est devenu le capitaine emblématique du club.',
        ),
      ];
    }
    
    // Par défaut pour les autres catégories
    return [
      Question(
        id: 'q_default',
        text: 'Qui est l\'actuel entraîneur du PSG ?',
        options: ['Carlo Ancelotti', 'Luis Enrique', 'Thomas Tuchel', 'Laurent Blanc'],
        correctAnswerIndex: 1,
        explanation: 'Luis Enrique a pris les rênes de l\'équipe première lors de la saison 2023-2024.',
      )
    ];
  }
}

// Le Provider qui permet au reste de l'app de récupérer ces questions facilement
final quizRepositoryProvider = Provider<MockQuizRepository>((ref) {
  return MockQuizRepository();
});
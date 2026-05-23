import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_radius.dart';
import '../../../../theme/app_spacing.dart';
import '../../../../theme/app_typography.dart';
import '../../data/repositories/mock_quiz_repository.dart';
import '../../domain/models/question.dart';
import '../../../../shared/providers/player_provider.dart';

// On demande la catégorie en paramètre pour savoir quelles questions charger
class QuizScreen extends ConsumerStatefulWidget {
  final String category;
  const QuizScreen({super.key, required this.category});

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  late List<Question> _questions;
  int _currentIndex = 0;
  int _score = 0;
  int? _selectedAnswerIndex;
  bool _isAnswered = false;

  @override
  void initState() {
    super.initState();
    // On charge les questions via Riverpod dès l'ouverture de l'écran
    _questions = ref.read(quizRepositoryProvider).getQuestionsForCategory(widget.category);
  }

  void _submitAnswer(int index) {
    if (_isAnswered) return; // Empêche le joueur de cliquer plusieurs fois

    setState(() {
      _selectedAnswerIndex = index;
      _isAnswered = true;
      // Vérifie si la réponse est correcte
      if (index == _questions[_currentIndex].correctAnswerIndex) {
        _score += 25; // 25 XP par bonne réponse
      }
    });
  }

  void _nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      // Passe à la question suivante
      setState(() {
        _currentIndex++;
        _selectedAnswerIndex = null;
        _isAnswered = false;
      });
    } else {
      // 🔴 NOUVEAU : On envoie l'XP gagnée au cerveau Riverpod !
      ref.read(playerProvider.notifier).addXp(_score);
      
      // Fin du quiz : On affiche le score et on retourne aux catégories
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Quiz terminé ! Tu as gagné $_score XP 🏆'),
          backgroundColor: AppColors.bleuPSG,
        ),
      );
      context.pop(); 
    }
  }

  @override
  Widget build(BuildContext context) {
    // Sécurité si la catégorie n'a pas de questions
    if (_questions.isEmpty) {
      return Scaffold(
        backgroundColor: AppColors.noirProfond,
        appBar: AppBar(backgroundColor: Colors.transparent),
        body: const Center(child: Text('Aucune question disponible ❌', style: TextStyle(color: Colors.white))),
      );
    }

    final question = _questions[_currentIndex];

    return Scaffold(
      backgroundColor: AppColors.noirProfond,
      appBar: AppBar(
        backgroundColor: AppColors.noirProfond,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.blanc),
          onPressed: () => context.pop(), // Bouton pour fuir le match
        ),
        title: Text(widget.category, style: AppTypography.h3),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.sections),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Indicateur de progression (ex: Question 1 / 3)
            Text(
              'Question ${_currentIndex + 1} / ${_questions.length}',
              style: AppTypography.caption.copyWith(color: AppColors.jauneXP),
            ),
            AppSpacing.h16,

            // 2. Le texte de la question
            Text(
              question.text,
              style: AppTypography.h2,
            ),
            AppSpacing.h32,

            // 3. Génération des 4 boutons de réponse
            ...List.generate(question.options.length, (index) {
              final isSelected = _selectedAnswerIndex == index;
              final isCorrect = index == question.correctAnswerIndex;

              // Logique de couleur automatique selon l'état de la réponse
              Color getButtonColor() {
                if (!_isAnswered) return AppColors.grisFonce; // État initial
                if (isCorrect) return AppColors.vertSucces; // La bonne réponse s'allume en vert
                if (isSelected && !isCorrect) return AppColors.rougeErreur; // La mauvaise réponse cliquée en rouge
                return AppColors.grisFonce; // Les autres restent grises
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: getButtonColor(),
                    foregroundColor: AppColors.blanc,
                    padding: const EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: AppRadius.m,
                      side: BorderSide(
                        color: isSelected ? AppColors.blanc : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                  onPressed: () => _submitAnswer(index),
                  child: Text(
                    question.options[index],
                    style: AppTypography.body,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }),

            const Spacer(),

            // 4. Bouton Suivant ou Terminer (Apparaît uniquement APRES avoir répondu)
            if (_isAnswered)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.bleuPSG,
                  foregroundColor: AppColors.blanc,
                  padding: const EdgeInsets.all(20),
                ),
                onPressed: _nextQuestion,
                child: Text(
                  _currentIndex < _questions.length - 1 ? 'QUESTION SUIVANTE' : 'TERMINER LE QUIZ',
                  style: AppTypography.body.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
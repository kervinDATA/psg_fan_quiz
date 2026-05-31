import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_radius.dart';
import '../../../../theme/app_spacing.dart';
import '../../../../theme/app_typography.dart';
import '../../data/repositories/remote_quiz_repository.dart';
import '../../domain/models/question.dart';
import '../../../../shared/providers/player_provider.dart';
import '../../data/repositories/quiz_result_repository.dart';
import '../../../../app/routes/app_router.dart';

// On demande la catégorie en paramètre pour savoir quelles questions charger
class QuizScreen extends ConsumerStatefulWidget {
  final String category;
  const QuizScreen({super.key, required this.category});

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  List<Question> _questions = []; // Plus besoin du 'late'
  bool _isLoading = true; // 👈 NOUVEAU : On gère l'état de chargement
  int _currentIndex = 0;
  int _score = 0;
  int _correctAnswersCount = 0; // 👈 NOUVEAU : Compteur de bonnes réponses
  int? _selectedAnswerIndex;
  bool _isAnswered = false;

  @override
  void initState() {
    super.initState();
    _loadQuestions(); // 👈 NOUVEAU : On lance le chargement asynchrone
  }

  // 🔴 NOUVEAU : Fonction asynchrone pour interroger Firestore
  Future<void> _loadQuestions() async {
    final questions = await ref.read(remoteQuizRepositoryProvider).getQuestionsForCategory(widget.category);
    if (mounted) {
      setState(() {
        _questions = questions;
        _isLoading = false; // Le chargement est terminé !
      });
    }
  }

  void _submitAnswer(int index) {
    if (_isAnswered) return; // Empêche le joueur de cliquer plusieurs fois

    setState(() {
      _selectedAnswerIndex = index;
      _isAnswered = true;
      // Vérifie si la réponse est correcte
      if (index == _questions[_currentIndex].correctAnswerIndex) {
        _score += 25; // 25 XP par bonne réponse
        _correctAnswersCount++; // 👈 NOUVEAU : On incrémente le compteur
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
      // On récupère le joueur actuel pour avoir son ID
      final player = ref.read(playerProvider);
      
      if (player != null) {
        // 🔴 NOUVEAU : On sauvegarde l'historique de la partie dans Firestore
        ref.read(quizResultRepositoryProvider).saveResult(
          userId: player.id,
          categoryId: widget.category,
          score: _score,
          correctAnswers: _correctAnswersCount,
          totalQuestions: _questions.length,
        );
      }

      // 🔴 NOUVEAU : Logique spécifique au Quiz du Jour
      int finalScore = _score;
      if (widget.category == 'Quiz du Jour') {
        ref.read(playerProvider.notifier).markDailyQuizAsPlayed(); // Verrouille le quiz
        finalScore += 25; // Bonus de 25 XP pour le défi quotidien 
      }

      ref.read(playerProvider.notifier).addMatchScore(finalScore);

      // 🔴 NOUVEAU : Fin du quiz, on navigue vers le bel écran de résultat en passant les stats !
      context.go(
        AppRoutes.result,
        extra: {
          'score': finalScore,
          'correctAnswers': _correctAnswersCount,
          'totalQuestions': _questions.length,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // 🔴 NOUVEAU : On affiche le loader pendant l'appel à Firebase
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: AppColors.noirProfond,
        body: Center(
          child: CircularProgressIndicator(color: AppColors.rougePSG),
        ),
      );
    }

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
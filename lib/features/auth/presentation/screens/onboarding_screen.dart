import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/routes/app_router.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_spacing.dart';
import '../../../../theme/app_typography.dart';
import '../../data/onboarding_slide_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Fonction pour gérer l'action du bouton principal
  void _onNextPressed() {
    if (_currentPage < onboardingSlides.length - 1) {
      // Passer au slide suivant avec une animation fluide
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // 🔴 NOUVEAU : Fin de l'Onboarding, direction la création de compte !
      context.go(AppRoutes.auth);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.noirProfond,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.sections),
          child: Column(
            children: [
              // Zone de boutons supérieure (ex: Passer l'onboarding)
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  // 🔴 NOUVEAU : Le bouton "Passer" envoie aussi vers la connexion
                  onPressed: () => context.go(AppRoutes.auth),
                  child: Text(
                    'Passer',
                    style: AppTypography.small.copyWith(
                      color: AppColors.grisClair,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              // Coeur de l'Onboarding : Le PageView pour faire défiler les slides
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingSlides.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final slide = onboardingSlides[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Titre du Slide [cite: 105]
                        Text(
                          slide.title,
                          textAlign: TextAlign.center,
                          style: AppTypography.h2.copyWith(
                            letterSpacing: 1.5,
                          ),
                        ),
                        
                        // Petit filet Rouge PSG sous le titre pour rappeler l'identité du club [cite: 98]
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: AppSpacing.blocsUI),
                          width: 40,
                          height: 3,
                          color: AppColors.rougePSG,
                        ),
                        
                        // Description du Slide [cite: 105]
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.standard),
                          child: Text(
                            slide.description,
                            textAlign: TextAlign.center,
                            style: AppTypography.body.copyWith(
                              color: AppColors.grisClair,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              // Zone inférieure : Indicateurs de pages (Dots) + Bouton d'action [cite: 105]
              Column(
                children: [
                  // Indicateurs (Dots) de progression
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingSlides.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        width: _currentPage == index ? 24.0 : 8.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? AppColors.rougePSG
                              : AppColors.grisFonce,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                  ),
                  
                  AppSpacing.h32,

                  // Bouton Principal Dynamique (Suivant ou Commencer) [cite: 105]
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _onNextPressed,
                      child: Text(
                        _currentPage == onboardingSlides.length - 1
                            ? 'COMMENCER'
                            : 'SUIVANT',
                      ),
                    ),
                  ),
                  
                  AppSpacing.h16,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
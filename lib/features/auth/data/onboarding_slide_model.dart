class OnboardingSlide {
  final String title;
  final String description;

  const OnboardingSlide({
    required this.title,
    required this.description,
  });
}

// Liste des slides officiels définis dans ton architecture fonctionnelle
const List<OnboardingSlide> onboardingSlides = [
  OnboardingSlide(
    title: 'TESTE TES CONNAISSANCES',
    description: 'Réponds aux questions sur l\'histoire, les joueurs et les matchs légendaires du club.',
  ),
  OnboardingSlide(
    title: 'GAGNE DE L\'XP',
    description: 'Accumule des points à chaque bonne réponse, enchaîne les séries et monte de niveau.',
  ),
  OnboardingSlide(
    title: 'DEVIENS UNE LÉGENDE',
    description: 'Débloque des badges exclusifs d\'Ultras et hisse-toi tout en haut du classement mondial.',
  ),
];
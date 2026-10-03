# PSG Fan Quiz — Architecture Flutter Réelle V1

## Version

```text
V1.0
```

---

# 1. Objectif du Document

Ce document définit l’architecture Flutter réelle du projet PSG Fan Quiz.

Il décrit :

- la structure réelle du projet Flutter,
- l’organisation des dossiers,
- les responsabilités des modules,
- les patterns retenus,
- l’intégration Firebase,
- Riverpod,
- GoRouter,
- les conventions de développement.

Ce document sert de fondation technique officielle du projet.

---

# 2. Philosophie Architecture

# Objectifs

Construire une architecture :

- propre,
- scalable,
- maintenable,
- modulaire,
- simple à faire évoluer.

---

# Approche retenue

```text
Feature First + Clean Architecture simplifiée
```

---

# Pourquoi

- séparation claire,
- modularité,
- code lisible,
- excellent pour Flutter scalable.

---

# 3. Architecture Générale

# Structure globale

```text
lib/
│
├── app/
├── core/
├── features/
├── shared/
├── theme/
└── main.dart
```

---

# Description modules

| Module | Usage |
|---|---|
| app | configuration application |
| core | outils globaux |
| features | modules métier |
| shared | composants partagés |
| theme | design system Flutter |

---

# 4. Module app/

# Objectif

Contenir :

- bootstrap application,
- configuration globale,
- routes,
- providers principaux.

---

# Structure

```text
app/
│
├── app.dart
├── providers.dart
└── routes/
    └── app_router.dart
```

---

# app.dart

# Responsabilité

Point d’entrée UI principal.

---

# Contient

- MaterialApp,
- theme,
- router,
- providers globaux.

---

# app_router.dart

# Responsabilité

Configuration GoRouter.

---

# Routes V1

```text
/
/onboarding
/profile-setup
/home
/categories
/quiz
/result
/leaderboard
/profile
```

---

# providers.dart

# Responsabilité

Providers globaux application.

---

# Exemples

- auth provider,
- firebase provider,
- analytics provider.

---

# 5. Module core/

# Objectif

Contenir tous les éléments techniques globaux.

---

# Structure

```text
core/
│
├── constants/
├── errors/
├── extensions/
├── services/
├── utils/
└── network/
```

---

# constants/

# Usage

Constantes globales.

---

# Exemples

```text
app_colors.dart
app_sizes.dart
app_strings.dart
firestore_paths.dart
```

---

# errors/

# Usage

Gestion erreurs globales.

---

# Exemples

```text
app_exception.dart
failure.dart
```

---

# extensions/

# Usage

Extensions Dart/Flutter.

---

# Exemples

```text
context_extension.dart
string_extension.dart
```

---

# services/

# Usage

Services techniques.

---

# Exemples

```text
analytics_service.dart
crashlytics_service.dart
notification_service.dart
```

---

# utils/

# Usage

Helpers utilitaires.

---

# Exemples

```text
date_utils.dart
score_utils.dart
quiz_utils.dart
```

---

# 6. Module features/

# Objectif

Contenir toute la logique métier.

---

# Structure V1

```text
features/
│
├── auth/
├── onboarding/
├── home/
├── categories/
├── quiz/
├── leaderboard/
└── profile/
```

---

# Philosophie

Chaque feature doit être indépendante.

---

# 7. Structure interne Feature

# Structure standard

```text
feature/
│
├── data/
├── domain/
├── presentation/
└── providers/
```

---

# data/

# Responsabilité

Gestion données.

---

# Contenu

```text
data/
│
├── datasources/
├── models/
├── repositories/
└── services/
```

---

# datasources/

# Usage

Connexion Firestore/Firebase.

---

# Exemples

```text
quiz_remote_datasource.dart
user_remote_datasource.dart
```

---

# models/

# Usage

Modèles JSON Firestore.

---

# Exemples

```text
question_model.dart
user_model.dart
quiz_result_model.dart
```

---

# repositories/

# Usage

Abstraction accès données.

---

# Exemples

```text
quiz_repository_impl.dart
user_repository_impl.dart
```

---

# domain/

# Responsabilité

Logique métier pure.

---

# Structure

```text
domain/
│
├── entities/
├── repositories/
└── usecases/
```

---

# entities/

# Usage

Objets métier.

---

# Exemples

```text
question.dart
user.dart
quiz_result.dart
```

---

# repositories/

# Usage

Interfaces repositories.

---

# Exemples

```text
quiz_repository.dart
user_repository.dart
```

---

# usecases/

# Usage

Actions métier.

---

# Exemples

```text
get_quiz_questions.dart
save_quiz_result.dart
calculate_xp.dart
```

---

# presentation/

# Responsabilité

Interface utilisateur.

---

# Structure

```text
presentation/
│
├── screens/
├── widgets/
└── controllers/
```

---

# screens/

# Usage

Pages Flutter.

---

# Exemples

```text
home_screen.dart
quiz_screen.dart
profile_screen.dart
```

---

# widgets/

# Usage

Widgets spécifiques feature.

---

# Exemples

```text
quiz_card.dart
score_widget.dart
badge_widget.dart
```

---

# controllers/

# Usage

Gestion logique écran.

---

# Exemples

```text
quiz_controller.dart
profile_controller.dart
```

---

# providers/

# Usage

Providers Riverpod feature.

---

# Exemples

```text
quiz_provider.dart
user_provider.dart
```

---

# 8. Module shared/

# Objectif

Contenir composants réutilisables.

---

# Structure

```text
shared/
│
├── widgets/
├── components/
├── models/
└── providers/
```

---

# widgets/

# Usage

Widgets réutilisables globaux.

---

# Exemples

```text
app_button.dart
app_loader.dart
app_card.dart
```

---

# components/

# Usage

Composants UI complexes.

---

# Exemples

```text
bottom_navigation.dart
xp_progress_bar.dart
```

---

# 9. Module theme/

# Objectif

Contenir le design system Flutter.

---

# Structure

```text
theme/
│
├── app_theme.dart
├── app_colors.dart
├── app_spacing.dart
├── app_typography.dart
└── app_radius.dart
```

---

# app_theme.dart

# Usage

ThemeData principal.

---

# app_colors.dart

# Usage

Couleurs officielles.

---

# Couleurs V1

```text
Bleu PSG : #0A1E5E
Rouge PSG : #D00027
Noir : #111111
Blanc : #FFFFFF
```

---

# 10. main.dart

# Responsabilité

Point d’entrée application.

---

# Contenu principal

- WidgetsFlutterBinding,
- Firebase.initializeApp(),
- ProviderScope,
- lancement app.

---

# 11. Riverpod Architecture

# Philosophie

Riverpod centralise :

- état utilisateur,
- quiz,
- Firestore,
- navigation métier.

---

# Providers principaux

| Provider | Usage |
|---|---|
| authProvider | utilisateur |
| quizProvider | quiz courant |
| leaderboardProvider | classement |
| profileProvider | profil |

---

# 12. Firestore Architecture

# Collections principales

```text
users
questions
quiz_results
leaderboard
categories
badges
```

---

# Data flow

```text
Firestore
    ↓
Datasource
    ↓
Repository
    ↓
UseCase
    ↓
Controller
    ↓
UI
```

---

# 13. Navigation Architecture

# GoRouter

## Navigation principale

```text
Bottom Navigation Bar
```

---

# Navigation Flow

```text
Splash
    ↓
Onboarding
    ↓
Home
    ↓
Quiz
    ↓
Result
```

---

# 14. Error Handling

# Objectif

Centraliser gestion erreurs.

---

# Types erreurs

| Type | Gestion |
|---|---|
| Firestore | snackbar |
| Network | retry |
| Validation | message UI |
| Unknown | fallback |

---

# 15. Logging

# Package recommandé

```text
logger
```

---

# Objectifs

- debug,
- monitoring,
- suivi erreurs.

---

# 16. Conventions Nommage

# Fichiers

```text
snake_case.dart
```

---

# Classes

```text
PascalCase
```

---

# Variables

```text
camelCase
```

---

# Providers

## Convention

```text
xxxProvider
```

---

# Controllers

## Convention

```text
xxxController
```

---

# 17. Qualité Code

# Règles principales

- widgets petits,
- composants réutilisables,
- logique séparée UI,
- éviter duplication.

---

# Analyse statique

## Commande

```bash
flutter analyze
```

---

# Formatage

## Commande

```bash
dart format .
```

---

# 18. Architecture UX Flutter

# Objectifs

- navigation fluide,
- animations rapides,
- UI responsive,
- expérience premium.

---

# Bonnes pratiques

- éviter rebuilds inutiles,
- widgets const,
- lazy loading futur.

---

# 19. Tests (Future)

# Types prévus

| Type | Usage |
|---|---|
| Unit Tests | logique métier |
| Widget Tests | composants UI |
| Integration Tests | flows complets |

---

# 20. Vision Future Architecture

# V2

- mode duel,
- notifications avancées,
- amis,
- saisons.

---

# V3

- multi-clubs,
- football mondial,
- backend plus complexe,
- fonctionnalités sociales.

---

# 21. Philosophie Finale

L’architecture doit permettre :

- développement rapide,
- maintenance simple,
- ajout fonctionnalités sans chaos,
- excellente expérience utilisateur.

Le projet doit rester :

```text
simple mais professionnel
```


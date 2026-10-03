# PSG Fan Quiz — Setup Technique Flutter V1

## Version

```text
V1.0
```

---

# 1. Objectif du Document

Ce document définit l’environnement technique officiel du projet PSG Fan Quiz.

Il sert de référence pour :

- le setup Flutter,
- la configuration Firebase,
- l’environnement de développement,
- la structure du projet,
- les conventions techniques,
- l’initialisation du repository Git.

---

# 2. Stack Technique Officielle

# Frontend Mobile

```text
Flutter
```

---

# Backend

```text
Firebase
```

---

# Base de données

```text
Cloud Firestore
```

---

# State Management

```text
Riverpod
```

---

# Navigation

```text
GoRouter
```

---

# Langage

```text
Dart
```

---

# 3. Environnement de Développement

# IDE recommandé

## Principal

```text
Visual Studio Code
```

---

## Alternative

```text
Android Studio
```

---

# Extensions VS Code

# Flutter

```text
Flutter Extension
```

---

# Dart

```text
Dart Extension
```

---

# Error Lens

```text
Error Lens
```

---

# GitLens

```text
GitLens
```

---

# Bracket Pair Colorizer

```text
Bracket Pair Colorizer
```

---

# 4. Installation Flutter

# Téléchargement

## Site officiel

```text
https://flutter.dev
```

---

# Vérification installation

## Commande

```bash
flutter doctor
```

---

# Objectif

Aucune erreur critique.

---

# 5. SDK Android

# Installation Android Studio

Installer :

- Android SDK,
- Android Emulator,
- Android Platform Tools.

---

# Variables d’environnement

## ANDROID_HOME

Configurer correctement.

---

# Vérification

## Commande

```bash
flutter doctor
```

---

# 6. Setup iOS

# Pré-requis

Uniquement sur macOS.

---

# Installation Xcode

Installer :

```text
Xcode
```

---

# Vérification

## Commande

```bash
flutter doctor
```

---

# 7. Git & Repository

# Repository Git

## Nom recommandé

```text
psg-fan-quiz
```

---

# Branches recommandées

| Branche | Usage |
|---|---|
| main | production |
| develop | développement |
| feature/* | fonctionnalités |

---

# Convention commits

## Format

```text
feat:
fix:
refactor:
style:
chore:
```

---

# Exemples

```text
feat: add quiz screen
fix: leaderboard loading bug
```

---

# 8. Création Projet Flutter

# Commande

```bash
flutter create psg_fan_quiz
```

---

# Lancement projet

## Commande

```bash
flutter run
```

---

# 9. Structure Flutter Officielle

# Structure cible

```text
lib/
│
├── app/
│   ├── routes/
│   ├── app.dart
│   └── providers.dart
│
├── core/
│   ├── constants/
│   ├── errors/
│   ├── extensions/
│   ├── services/
│   └── utils/
│
├── features/
│   ├── auth/
│   ├── onboarding/
│   ├── home/
│   ├── quiz/
│   ├── leaderboard/
│   ├── profile/
│   └── categories/
│
├── shared/
│   ├── widgets/
│   ├── components/
│   ├── models/
│   └── providers/
│
├── theme/
│   ├── app_theme.dart
│   ├── colors.dart
│   ├── spacing.dart
│   └── typography.dart
│
└── main.dart
```

---

# 10. Packages Flutter Officiels

# Core

## Riverpod

```yaml
flutter_riverpod
```

---

## GoRouter

```yaml
go_router
```

---

## Freezed

```yaml
freezed
freezed_annotation
```

---

## JSON Serialization

```yaml
json_serializable
json_annotation
```

---

# Firebase

## Firebase Core

```yaml
firebase_core
```

---

## Firebase Auth

```yaml
firebase_auth
```

---

## Firestore

```yaml
cloud_firestore
```

---

## Analytics

```yaml
firebase_analytics
```

---

## Crashlytics

```yaml
firebase_crashlytics
```

---

## Notifications

```yaml
firebase_messaging
```

---

# UI

## SVG

```yaml
flutter_svg
```

---

## Animations

```yaml
flutter_animate
```

---

## Google Fonts

```yaml
google_fonts
```

---

# 11. Firebase Setup

# Création projet Firebase

## Nom recommandé

```text
psg-fan-quiz
```

---

# Firebase Services à activer

| Service | Usage |
|---|---|
| Authentication | utilisateurs |
| Firestore | base données |
| Analytics | analytics |
| Crashlytics | monitoring |
| Cloud Messaging | notifications |

---

# Installation FlutterFire CLI

## Commande

```bash
dart pub global activate flutterfire_cli
```

---

# Configuration Firebase

## Commande

```bash
flutterfire configure
```

---

# 12. Authentification V1

# Stratégie retenue

## V1

```text
Connexion anonyme Firebase
```

---

# Pourquoi

- réduction friction,
- MVP rapide,
- onboarding simplifié.

---

# Évolution future

## V2

- Google Sign-In,
- Apple Sign-In,
- Email/Password.

---

# 13. Firestore

# Collections principales

| Collection | Usage |
|---|---|
| users | profils |
| questions | quiz |
| quiz_results | résultats |
| leaderboard | classement |
| badges | badges |
| categories | catégories |

---

# 14. Architecture Riverpod

# Philosophie

Utiliser Riverpod pour :

- état global,
- données utilisateur,
- quiz,
- Firestore,
- navigation métier.

---

# Types providers

| Type | Usage |
|---|---|
| Provider | services |
| StateProvider | état simple |
| FutureProvider | appels async |
| StateNotifierProvider | logique métier |

---

# 15. Navigation GoRouter

# Structure navigation

```text
/
/onboarding
/home
/categories
/quiz
/result
/leaderboard
/profile
```

---

# Navigation V1

## Type

```text
Bottom Navigation Bar
```

---

# 16. Theme System

# Couleurs principales

## Bleu PSG

```text
#0A1E5E
```

---

## Rouge PSG

```text
#D00027
```

---

## Blanc

```text
#FFFFFF
```

---

## Noir

```text
#111111
```

---

# Police officielle

## Recommandation

```text
Poppins
```

---

# 17. Responsive Design

# Objectifs

Compatibilité :

- Android,
- iPhone,
- petits écrans,
- grands écrans.

---

# Bonnes pratiques

- éviter tailles fixes,
- MediaQuery,
- LayoutBuilder,
- UI flexible.

---

# 18. Logging & Debug

# Logging recommandé

## Utilisation

```text
logger package
```

---

# Objectifs

- debug,
- monitoring,
- analyse erreurs.

---

# 19. Qualité Code

# Règles

- widgets petits,
- composants réutilisables,
- séparation logique/UI,
- architecture feature-first.

---

# Nommage

## Fichiers

```text
snake_case.dart
```

---

## Classes

```text
PascalCase
```

---

## Variables

```text
camelCase
```

---

# 20. Gestion Assets

# Dossiers

```text
assets/
│
├── images/
├── icons/
├── logos/
├── animations/
└── fonts/
```

---

# Assets prévus

- logo PSG Fan Quiz,
- avatars,
- badges,
- icônes,
- backgrounds.

---

# 21. Environnements

# V1

## Environnement unique

```text
development
```

---

# Évolution future

## V2

- dev,
- staging,
- production.

---

# 22. Tests

# V1

## Priorité

Tests manuels.

---

# Évolution future

## Tests prévus

- unit tests,
- widget tests,
- integration tests.

---

# 23. Performance

# Objectifs

- app fluide,
- chargements rapides,
- optimisation Firestore.

---

# Bonnes pratiques

- limiter rebuilds,
- lazy loading,
- pagination future.

---

# 24. Sécurité

# Firestore Rules

Protection :

- profils,
- scores,
- leaderboard.

---

# Firebase App Check

À prévoir plus tard.

---

# 25. CI/CD (Future)

# Vision future

Automatisation :

- builds,
- tests,
- publication.

---

# Outils potentiels

- GitHub Actions,
- Codemagic,
- Bitrise.

---

# 26. Workflow Développement

# Étapes officielles

## 1.

Setup Flutter.

---

## 2.

Setup Firebase.

---

## 3.

Architecture projet.

---

## 4.

Theme system.

---

## 5.

Navigation.

---

## 6.

Onboarding.

---

## 7.

Quiz engine.

---

## 8.

Firestore.

---

## 9.

Gamification.

---

## 10.

Tests & release.

---

# 27. Philosophie Technique

Le projet doit rester :

- simple,
- scalable,
- maintenable,
- moderne.

Le MVP doit être développé rapidement sans sacrifier la qualité de l’architecture.


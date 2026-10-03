# PSG Fan Quiz — Repository Git & Workflow Dev

## Version

```text
V1.0
```

---

# 1. Objectif du Document

Ce document définit :

- l’organisation du repository Git,
- le workflow de développement,
- les conventions Git,
- les stratégies de branches,
- les conventions de commits,
- les règles de qualité projet.

Il sert de référence officielle pour le développement de PSG Fan Quiz.

---

# 2. Philosophie Projet

# Objectif principal

Construire un projet :

- propre,
- maintenable,
- scalable,
- professionnel,
- organisé.

---

# Règle importante

Même si le projet démarre seul :

```text
Le projet doit être structuré comme un vrai produit professionnel.
```

---

# 3. Repository Git

# Nom recommandé

```text
psg-fan-quiz
```

---

# Hébergement recommandé

## Principal

```text
GitHub
```

---

# Pourquoi GitHub

- standard industrie,
- CI/CD futur,
- visibilité,
- gestion branches,
- intégration Flutter.

---

# 4. Structure du Repository

# Structure globale

```text
psg-fan-quiz/
│
├── .github/
├── .vscode/
├── android/
├── ios/
├── lib/
├── test/
├── assets/
├── docs/
├── scripts/
├── pubspec.yaml
├── README.md
└── .gitignore
```

---

# Description dossiers

| Dossier | Usage |
|---|---|
| .github | CI/CD futur |
| .vscode | configuration IDE |
| android | configuration Android |
| ios | configuration iOS |
| lib | code Flutter |
| test | tests |
| assets | images, fonts, animations |
| docs | documentation projet |
| scripts | scripts utilitaires |

---

# 5. Branche Principale

# main

## Usage

Branche production stable.

---

# Règles

- toujours stable,
- jamais de code cassé,
- uniquement code validé.

---

# 6. Branche Développement

# develop

## Usage

Branche développement principale.

---

# Objectif

Fusionner toutes les nouvelles fonctionnalités.

---

# 7. Branches Features

# Convention

```text
feature/<nom-feature>
```

---

# Exemples

```text
feature/onboarding
feature/quiz-engine
feature/leaderboard
feature/profile-screen
```

---

# Objectif

Isoler chaque fonctionnalité.

---

# 8. Branches Fix

# Convention

```text
fix/<nom-fix>
```

---

# Exemples

```text
fix/navigation-bug
fix/firestore-error
```

---

# 9. Workflow Développement

# Workflow officiel

```text
main
  ↑
develop
  ↑
feature/*
```

---

# Processus standard

## Étape 1

Créer branche feature.

---

## Étape 2

Développer fonctionnalité.

---

## Étape 3

Tester localement.

---

## Étape 4

Merge vers develop.

---

## Étape 5

Validation globale.

---

## Étape 6

Merge develop → main.

---

# 10. Convention Commits

# Format officiel

```text
<type>: <description>
```

---

# Types autorisés

| Type | Usage |
|---|---|
| feat | nouvelle fonctionnalité |
| fix | correction bug |
| refactor | refactoring |
| style | UI/style |
| chore | maintenance |
| docs | documentation |
| test | tests |

---

# Exemples

```text
feat: add onboarding screen
feat: implement quiz timer
fix: resolve firestore loading issue
style: improve leaderboard cards
refactor: clean quiz controller
```

---

# Règles commits

- commits petits,
- commits clairs,
- une responsabilité par commit.

---

# 11. Pull Requests (Future)

# Objectif

Préparer future collaboration.

---

# Structure PR

## Contenu

- description,
- captures écran,
- tests effectués,
- impacts techniques.

---

# Validation PR

## Checklist

- code compile,
- pas erreurs analyse,
- UI correcte,
- tests réalisés.

---

# 12. Versioning

# Stratégie

```text
Semantic Versioning
```

---

# Format

```text
MAJOR.MINOR.PATCH
```

---

# Exemples

| Version | Signification |
|---|---|
| 1.0.0 | release majeure |
| 1.1.0 | nouvelle feature |
| 1.1.1 | bug fix |

---

# 13. Gestion Documentation

# Dossier officiel

```text
docs/
```

---

# Contenu

- architecture,
- design system,
- Firestore,
- roadmap,
- wireframes,
- backlog.

---

# Format officiel

```text
Markdown
```

---

# 14. Gestion Assets

# Structure

```text
assets/
│
├── images/
├── icons/
├── logos/
├── avatars/
├── badges/
├── animations/
└── fonts/
```

---

# Convention fichiers

## Format

```text
snake_case
```

---

# Exemples

```text
quiz_background.png
badge_gold.png
avatar_default.png
```

---

# 15. Git Ignore

# Éléments à ignorer

## Flutter

- build/
- .dart_tool/
- .packages
- pubspec.lock (selon stratégie)

---

## IDE

- .idea/
- .vscode/

---

## Secrets

- firebase credentials,
- API keys,
- .env.

---

# 16. Secrets & Variables

# Règle critique

```text
Ne jamais commit de secrets.
```

---

# Stockage recommandé

## Future

```text
.env
```

---

# 17. Qualité Code

# Objectifs

- lisibilité,
- maintenabilité,
- modularité.

---

# Règles

- widgets petits,
- séparation logique/UI,
- composants réutilisables,
- architecture feature-first.

---

# Analyse statique

## Commande

```bash
flutter analyze
```

---

# Formatting

## Commande

```bash
dart format .
```

---

# 18. Workflow Développement Flutter

# Étapes officielles

## 1.

Créer branche feature.

---

## 2.

Développer feature.

---

## 3.

Tester Android.

---

## 4.

Tester iPhone.

---

## 5.

flutter analyze.

---

## 6.

Commit propre.

---

## 7.

Merge develop.

---

# 19. Workflow Firebase

# Bonnes pratiques

- Firestore rules testées,
- données validation,
- monitoring Crashlytics.

---

# Sécurité

- limiter accès Firestore,
- protéger leaderboard,
- validation utilisateur.

---

# 20. CI/CD (Future)

# Vision future

Pipeline automatisé :

- tests,
- build Android,
- build iOS,
- release.

---

# Outils potentiels

| Outil | Usage |
|---|---|
| GitHub Actions | CI/CD |
| Codemagic | Flutter CI/CD |
| Bitrise | mobile pipelines |

---

# 21. Workflow Release

# Processus futur

```text
feature → develop → main → release stores
```

---

# Étapes release

## Android

- build release,
- signature,
- Play Store.

---

## iOS

- build iOS,
- TestFlight,
- App Store.

---

# 22. Sauvegarde Projet

# Objectif

Éviter perte travail.

---

# Règles

- push régulier,
- commits fréquents,
- documentation à jour.

---

# 23. Philosophie Workflow

Le workflow doit rester :

- simple,
- professionnel,
- scalable,
- compréhensible.

---

# Objectif final

Préparer PSG Fan Quiz à évoluer comme un vrai produit logiciel professionnel.


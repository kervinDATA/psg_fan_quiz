# PSG Fan Quiz — Architecture Projet V1

## Version

```text
V1.0
```

---

# 1. Objectif du Document

Ce document définit l’architecture globale du projet mobile PSG Fan Quiz.

Il sert de référence pour :

- la structure du projet,
- les choix techniques,
- l’organisation Flutter,
- les bonnes pratiques,
- la scalabilité future,
- la maintenabilité du code.

---

# 2. Vision Technique

## Objectif principal

Construire une application mobile :

- moderne,
- scalable,
- maintenable,
- performante,
- simple à faire évoluer.

---

## Contraintes du projet

### V1

Petit projet personnel mais construit proprement.

---

## Vision long terme

Possibilité d’évolution vers :

- plus d’utilisateurs,
- nouvelles fonctionnalités,
- multi-clubs,
- gamification avancée,
- backend plus complexe.

---

# 3. Stack Technique

# Frontend Mobile

## Technologie

```text
Flutter
```

---

## Pourquoi Flutter

- un seul code Android + iOS,
- excellente performance,
- UI moderne,
- animations fluides,
- forte communauté,
- développement rapide,
- parfait pour MVP scalable.

---

# Backend

## Technologie

```text
Firebase
```

---

## Services Firebase utilisés

| Service | Usage |
|---|---|
| Firebase Auth | authentification |
| Cloud Firestore | base de données |
| Firebase Analytics | analytics |
| Firebase Crashlytics | crash reporting |
| Firebase Cloud Messaging | notifications push |

---

# 4. Architecture Flutter

# Architecture retenue

## Approche

```text
Feature First + Clean Architecture simplifiée
```

---

## Objectifs

- séparation des responsabilités,
- modularité,
- lisibilité,
- évolutivité,
- testabilité.

---

# 5. State Management

## Solution retenue

```text
Riverpod
```

---

## Pourquoi Riverpod

- moderne,
- scalable,
- performant,
- propre,
- excellent avec Flutter.

---

# 6. Navigation

## Solution retenue

```text
GoRouter
```

---

## Pourquoi GoRouter

- navigation moderne,
- gestion propre des routes,
- scalable,
- recommandé Flutter.

---

# 7. Architecture des Dossiers

## Structure cible

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
│   ├── utils/
│   ├── extensions/
│   └── services/
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
│   ├── models/
│   ├── components/
│   └── providers/
│
├── theme/
│   ├── colors.dart
│   ├── typography.dart
│   ├── spacing.dart
│   └── app_theme.dart
│
└── main.dart
```

---

# 8. Structure d’une Feature

## Exemple : quiz

```text
quiz/
│
├── data/
│   ├── datasources/
│   ├── models/
│   ├── repositories/
│   └── services/
│
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
│
├── presentation/
│   ├── screens/
│   ├── widgets/
│   ├── providers/
│   └── controllers/
│
└── quiz_feature.dart
```

---

# 9. Modules Fonctionnels

# Auth

## Responsabilités

- création pseudo,
- connexion anonyme,
- futur login Google/Apple.

---

# Home

## Responsabilités

- écran principal,
- accès quiz,
- quiz quotidien,
- accès profil.

---

# Quiz

## Responsabilités

- chargement questions,
- gestion réponses,
- score,
- timer,
- résultats.

---

# Categories

## Responsabilités

- liste catégories,
- filtrage quiz.

---

# Leaderboard

## Responsabilités

- classement global,
- tri scores,
- affichage top joueurs.

---

# Profile

## Responsabilités

- statistiques utilisateur,
- badges,
- niveau,
- historique.

---

# 10. Architecture Firestore

# Collections principales

## users

```text
Profils utilisateurs
```

---

## questions

```text
Questions des quiz
```

---

## quiz_results

```text
Historique des parties
```

---

## leaderboard

```text
Classements utilisateurs
```

---

# 11. Modèle Utilisateur

## Exemple

```json
{
  "id": "user_001",
  "pseudo": "Kervin",
  "avatar": "avatar_1",
  "xp": 1250,
  "level": 7,
  "totalScore": 5400,
  "badges": ["historien_psg"],
  "createdAt": "2026-05-16"
}
```

---

# 12. Modèle Question

## Exemple

```json
{
  "id": "q_001",
  "category": "joueurs",
  "type": "qcm",
  "difficulty": "facile",
  "question": "Quel joueur est le meilleur buteur du PSG ?",
  "answers": [
    "Mbappé",
    "Cavani",
    "Ibrahimović",
    "Neymar"
  ],
  "correctAnswer": "Mbappé",
  "explanation": "Mbappé est devenu le meilleur buteur du club.",
  "points": 10
}
```

---

# 13. Design System

# Couleurs principales

## Bleu PSG

```text
#0A1E5E
```

## Rouge PSG

```text
#D00027
```

## Blanc

```text
#FFFFFF
```

## Noir

```text
#111111
```

---

# Style UI

## Direction artistique

- moderne,
- premium,
- football,
- gaming,
- immersif.

---

# Animations

## Objectifs

- fluidité,
- dynamisme,
- feedback utilisateur.

---

## Animations prévues

- transitions écrans,
- animations score,
- progression XP,
- badges débloqués.

---

# 14. Sécurité

# Règles Firestore

## Objectifs

- empêcher modification non autorisée,
- protéger les données,
- éviter le spam.

---

# Validation des données

Validation :

- pseudo,
- scores,
- XP,
- quiz.

---

# 15. Analytics

## Données suivies

- quiz lancés,
- quiz terminés,
- catégories populaires,
- temps moyen,
- rétention.

---

# 16. Notifications Push

## Cas d’usage

- quiz quotidien,
- retour utilisateur,
- récompenses,
- événements spéciaux.

---

# 17. CI/CD (plus tard)

## Vision future

Pipeline automatisé :

- build Android,
- build iOS,
- tests,
- déploiement.

---

# 18. Roadmap Technique

# Phase 1 — Fondations

- setup Flutter,
- setup Firebase,
- architecture,
- navigation,
- thème.

---

# Phase 2 — Fonctionnalités Core

- onboarding,
- quiz,
- profil,
- score,
- leaderboard.

---

# Phase 3 — Gamification

- badges,
- niveaux,
- quiz quotidien,
- streaks.

---

# Phase 4 — Optimisation

- performance,
- animations,
- analytics,
- UX.

---

# 19. Hors Scope V1

Non inclus :

- chat,
- réseau social,
- duel temps réel,
- paiement,
- boutique,
- multi-clubs.

---

# 20. Philosophie Projet

Le projet doit rester :

- simple,
- propre,
- scalable,
- maintenable.

L’objectif n’est pas de construire une application énorme immédiatement.

L’objectif est de construire :

> une excellente V1 solide et évolutive.


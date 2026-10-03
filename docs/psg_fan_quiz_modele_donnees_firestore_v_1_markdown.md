# PSG Fan Quiz — Modèle de Données Firestore V1

## Version

```text
V1.0
```

---

# 1. Objectif du Document

Ce document définit le modèle de données Firestore de l’application mobile PSG Fan Quiz.

Il décrit :

- les collections,
- les documents,
- les champs,
- les types,
- les relations logiques,
- les conventions de nommage,
- les règles de sécurité,
- les exemples JSON.

---

# 2. Base de Données Retenue

## Technologie

```text
Cloud Firestore
```

---

# Pourquoi Firestore

- temps réel,
- scalable,
- simple à intégrer avec Flutter,
- excellent avec Firebase,
- rapide pour MVP,
- peu de maintenance backend.

---

# 3. Conventions Globales

# Convention de nommage

## Collections

```text
snake_case
```

Exemple :

```text
quiz_results
```

---

## Champs

```text
camelCase
```

Exemple :

```text
createdAt
```

---

# Dates

Toutes les dates doivent être stockées au format :

```text
Timestamp Firestore
```

---

# IDs

## Format

```text
UUID automatique Firestore
```

---

# 4. Collections Principales

# Liste

| Collection | Description |
|---|---|
| users | profils utilisateurs |
| questions | questions quiz |
| quiz_results | résultats quiz |
| categories | catégories quiz |
| badges | badges disponibles |
| daily_quizzes | quiz quotidiens |
| leaderboard | classement |

---

# 5. Collection — users

# Description

Contient les profils utilisateurs.

---

# Structure

```json
{
  "pseudo": "Kervin",
  "avatar": "avatar_1",
  "xp": 1250,
  "level": 7,
  "totalScore": 5400,
  "quizPlayed": 42,
  "correctAnswers": 310,
  "bestScore": 180,
  "badges": [
    "historien_psg",
    "expert_classico"
  ],
  "dailyStreak": 5,
  "lastDailyQuizAt": "timestamp",
  "createdAt": "timestamp",
  "updatedAt": "timestamp"
}
```

---

# Champs

| Champ | Type | Description |
|---|---|---|
| pseudo | string | pseudo utilisateur |
| avatar | string | avatar sélectionné |
| xp | number | expérience totale |
| level | number | niveau utilisateur |
| totalScore | number | score cumulé |
| quizPlayed | number | nombre quiz joués |
| correctAnswers | number | bonnes réponses |
| bestScore | number | meilleur score |
| badges | array<string> | badges débloqués |
| dailyStreak | number | série quotidienne |
| lastDailyQuizAt | timestamp | dernier quiz quotidien |
| createdAt | timestamp | création profil |
| updatedAt | timestamp | mise à jour profil |

---

# 6. Collection — questions

# Description

Contient toutes les questions disponibles.

---

# Structure

```json
{
  "categoryId": "joueurs",
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
  "points": 10,
  "isDailyQuiz": false,
  "isActive": true,
  "createdAt": "timestamp",
  "updatedAt": "timestamp"
}
```

---

# Champs

| Champ | Type | Description |
|---|---|---|
| categoryId | string | catégorie question |
| type | string | qcm, vrai/faux, chrono |
| difficulty | string | facile, moyen, difficile |
| question | string | texte question |
| answers | array<string> | réponses possibles |
| correctAnswer | string | bonne réponse |
| explanation | string | explication réponse |
| points | number | points gagnés |
| isDailyQuiz | boolean | question quotidienne |
| isActive | boolean | question active |
| createdAt | timestamp | création |
| updatedAt | timestamp | modification |

---

# 7. Collection — categories

# Description

Liste des catégories de quiz.

---

# Structure

```json
{
  "name": "Joueurs",
  "slug": "joueurs",
  "icon": "players_icon",
  "color": "#0A1E5E",
  "isActive": true,
  "createdAt": "timestamp"
}
```

---

# Champs

| Champ | Type | Description |
|---|---|---|
| name | string | nom catégorie |
| slug | string | identifiant unique |
| icon | string | icône catégorie |
| color | string | couleur UI |
| isActive | boolean | catégorie active |
| createdAt | timestamp | création |

---

# 8. Collection — quiz_results

# Description

Historique des quiz joués.

---

# Structure

```json
{
  "userId": "user_001",
  "categoryId": "joueurs",
  "score": 120,
  "correctAnswers": 8,
  "wrongAnswers": 2,
  "totalQuestions": 10,
  "xpEarned": 150,
  "durationSeconds": 95,
  "completed": true,
  "createdAt": "timestamp"
}
```

---

# Champs

| Champ | Type | Description |
|---|---|---|
| userId | string | utilisateur |
| categoryId | string | catégorie quiz |
| score | number | score final |
| correctAnswers | number | bonnes réponses |
| wrongAnswers | number | mauvaises réponses |
| totalQuestions | number | nombre questions |
| xpEarned | number | XP gagné |
| durationSeconds | number | durée quiz |
| completed | boolean | quiz terminé |
| createdAt | timestamp | date quiz |

---

# 9. Collection — badges

# Description

Liste des badges disponibles.

---

# Structure

```json
{
  "name": "Historien PSG",
  "slug": "historien_psg",
  "description": "100% au quiz histoire",
  "icon": "badge_history",
  "xpReward": 100,
  "isActive": true,
  "createdAt": "timestamp"
}
```

---

# Champs

| Champ | Type | Description |
|---|---|---|
| name | string | nom badge |
| slug | string | identifiant badge |
| description | string | description badge |
| icon | string | icône badge |
| xpReward | number | récompense XP |
| isActive | boolean | badge actif |
| createdAt | timestamp | création |

---

# 10. Collection — daily_quizzes

# Description

Gestion des quiz quotidiens.

---

# Structure

```json
{
  "date": "2026-05-16",
  "questionIds": [
    "q_001",
    "q_002",
    "q_003"
  ],
  "bonusXp": 75,
  "isActive": true,
  "createdAt": "timestamp"
}
```

---

# Champs

| Champ | Type | Description |
|---|---|---|
| date | string | date quiz quotidien |
| questionIds | array<string> | questions utilisées |
| bonusXp | number | bonus XP |
| isActive | boolean | quiz actif |
| createdAt | timestamp | création |

---

# 11. Collection — leaderboard

# Description

Classement global utilisateurs.

---

# Structure

```json
{
  "userId": "user_001",
  "pseudo": "Kervin",
  "avatar": "avatar_1",
  "level": 7,
  "xp": 1250,
  "totalScore": 5400,
  "updatedAt": "timestamp"
}
```

---

# Champs

| Champ | Type | Description |
|---|---|---|
| userId | string | identifiant utilisateur |
| pseudo | string | pseudo |
| avatar | string | avatar |
| level | number | niveau |
| xp | number | expérience |
| totalScore | number | score total |
| updatedAt | timestamp | mise à jour |

---

# 12. Relations Logiques

# Relations principales

| Source | Relation | Cible |
|---|---|---|
| quiz_results.userId | → | users |
| quiz_results.categoryId | → | categories |
| questions.categoryId | → | categories |
| leaderboard.userId | → | users |

---

# 13. Index Firestore Recommandés

# users

## Index

```text
xp DESC
```

---

# leaderboard

## Index

```text
totalScore DESC
```

---

# questions

## Index

```text
categoryId ASC
isActive ASC
```

---

# quiz_results

## Index

```text
userId ASC
createdAt DESC
```

---

# 14. Règles de Sécurité Firestore

# Objectifs

- empêcher modification frauduleuse,
- protéger les scores,
- protéger les profils.

---

# Règles générales

## users

- lecture autorisée,
- écriture uniquement utilisateur propriétaire.

---

## questions

- lecture publique,
- écriture admin uniquement.

---

## leaderboard

- lecture publique,
- écriture serveur uniquement.

---

## quiz_results

- création utilisateur autorisée,
- modification interdite après création.

---

# 15. Stratégie Scalabilité

# Objectifs

Préparer le projet pour :

- augmentation utilisateurs,
- nouveaux quiz,
- nouvelles catégories,
- nouvelles fonctionnalités.

---

# Bonnes pratiques

- documents petits,
- collections simples,
- éviter sous-collections inutiles,
- limiter lectures Firestore.

---

# 16. Gestion du Contenu Quiz

# Sources des questions

- création manuelle,
- génération IA,
- import JSON.

---

# Workflow recommandé

```text
Création Question
    ↓
Validation
    ↓
Import Firestore
    ↓
Activation
```

---

# 17. Sauvegarde et Monitoring

# Outils Firebase

- Analytics,
- Crashlytics,
- Firestore monitoring.

---

# Objectifs

- suivi bugs,
- suivi performance,
- suivi rétention.

---

# 18. Vision Future

# V2

- amis,
- duel online,
- saisons,
- événements.

---

# V3

- multi-clubs,
- football mondial,
- fantasy football,
- communauté.


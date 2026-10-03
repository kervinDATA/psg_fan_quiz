# PSG Fan Quiz — Backlog MVP & Roadmap

## Version

```text
V1.0
```

---

# 1. Objectif du Document

Ce document définit :

- le backlog MVP,
- les priorités produit,
- la roadmap technique,
- les tâches de développement,
- les milestones,
- les phases de livraison.

Il sert de référence principale pour l’exécution du projet.

---

# 2. Vision Produit

# Vision V1

Créer une application mobile stable, moderne et engageante permettant aux fans du PSG de jouer à des quiz et progresser grâce à un système de gamification.

---

# Vision V2

Ajouter des fonctionnalités communautaires et compétitives.

---

# Vision V3

Étendre le projet vers :

- multi-clubs,
- football mondial,
- événements,
- expérience sociale avancée.

---

# 3. Philosophie MVP

# Objectif

Construire rapidement une V1 :

- propre,
- stable,
- simple,
- scalable.

---

# Règle importante

Le MVP doit rester :

```text
simple mais solide
```

---

# 4. Priorisation

# Niveaux de priorité

| Niveau | Description |
|---|---|
| Critical | obligatoire MVP |
| Important | fortement recommandé |
| Nice to have | optionnel |

---

# 5. Architecture du Backlog

# Structure

```text
Epic
    ↓
Feature
    ↓
Task
```

---

# 6. EPIC — Initialisation Projet

# Priorité

```text
Critical
```

---

# Features

## Setup Flutter

### Tasks

- installer Flutter,
- créer projet Flutter,
- config Android,
- config iOS,
- setup environnement.

---

## Setup Firebase

### Tasks

- créer projet Firebase,
- connecter Android,
- connecter iOS,
- setup Firestore,
- setup Auth,
- setup Analytics,
- setup Crashlytics.

---

## Setup Architecture

### Tasks

- structure dossiers,
- setup Riverpod,
- setup GoRouter,
- setup thème,
- setup constants.

---

# 7. EPIC — Authentification

# Priorité

```text
Critical
```

---

# Features

## Création profil

### Tasks

- écran pseudo,
- validation pseudo,
- sélection avatar,
- sauvegarde Firestore.

---

## Connexion anonyme

### Tasks

- setup Firebase Auth,
- création session utilisateur,
- récupération session.

---

# 8. EPIC — Onboarding

# Priorité

```text
Important
```

---

# Features

## Splash Screen

### Tasks

- logo,
- animation,
- vérification session.

---

## Onboarding

### Tasks

- slides onboarding,
- transitions,
- bouton commencer.

---

# 9. EPIC — Home Screen

# Priorité

```text
Critical
```

---

# Features

## Écran accueil

### Tasks

- header utilisateur,
- niveau,
- XP,
- bouton jouer,
- bouton quiz quotidien,
- navigation.

---

# 10. EPIC — Catégories

# Priorité

```text
Critical
```

---

# Features

## Liste catégories

### Tasks

- récupération catégories,
- affichage cards,
- navigation quiz.

---

# 11. EPIC — Quiz Engine

# Priorité

```text
Critical
```

---

# Features

## Chargement questions

### Tasks

- récupération Firestore,
- génération quiz,
- randomisation.

---

## Système réponses

### Tasks

- validation réponses,
- gestion erreurs,
- transitions questions.

---

## Timer

### Tasks

- chrono,
- timeout,
- animation timer.

---

## Gestion score

### Tasks

- calcul points,
- bonus chrono,
- score final.

---

## Fin quiz

### Tasks

- sauvegarde résultats,
- calcul XP,
- navigation résultat.

---

# 12. EPIC — Résultat Quiz

# Priorité

```text
Critical
```

---

# Features

## Écran résultat

### Tasks

- score final,
- XP gagné,
- bonnes réponses,
- bouton rejouer,
- retour accueil.

---

## Animations résultats

### Tasks

- animation score,
- animation XP,
- animation badge.

---

# 13. EPIC — Profil Utilisateur

# Priorité

```text
Important
```

---

# Features

## Profil

### Tasks

- affichage statistiques,
- historique quiz,
- badges,
- progression.

---

# 14. EPIC — Leaderboard

# Priorité

```text
Important
```

---

# Features

## Classement

### Tasks

- récupération scores,
- tri leaderboard,
- affichage top joueurs.

---

# 15. EPIC — Gamification

# Priorité

```text
Important
```

---

# Features

## XP

### Tasks

- calcul XP,
- montée niveau,
- progression.

---

## Badges

### Tasks

- règles badges,
- déblocage badges,
- affichage badges.

---

# 16. EPIC — Quiz Quotidien

# Priorité

```text
Nice to have
```

---

# Features

## Quiz quotidien

### Tasks

- génération quiz quotidien,
- restriction 1/jour,
- bonus XP.

---

# 17. EPIC — Design System

# Priorité

```text
Critical
```

---

# Features

## Thème global

### Tasks

- couleurs,
- typography,
- spacing,
- radius.

---

## Composants UI

### Tasks

- boutons,
- cards,
- loaders,
- badges,
- navigation.

---

# 18. EPIC — Animations

# Priorité

```text
Important
```

---

# Features

## Animations UI

### Tasks

- transitions,
- animations score,
- animations XP,
- animations badges.

---

# 19. EPIC — Firestore

# Priorité

```text
Critical
```

---

# Features

## Collections

### Tasks

- users,
- questions,
- quiz_results,
- leaderboard,
- badges.

---

## Règles sécurité

### Tasks

- règles Firestore,
- validation accès,
- protection données.

---

# 20. EPIC — Analytics

# Priorité

```text
Important
```

---

# Features

## Firebase Analytics

### Tasks

- tracking quiz,
- tracking rétention,
- tracking catégories.

---

# 21. EPIC — Crash Reporting

# Priorité

```text
Important
```

---

# Features

## Crashlytics

### Tasks

- setup crash reporting,
- logs erreurs,
- monitoring stabilité.

---

# 22. EPIC — Tests

# Priorité

```text
Critical
```

---

# Features

## Tests manuels

### Tasks

- Android,
- iPhone,
- navigation,
- quiz.

---

## Tests UX

### Tasks

- fluidité,
- ergonomie,
- lisibilité.

---

# 23. EPIC — Publication

# Priorité

```text
Important
```

---

# Features

## Android Release

### Tasks

- build release,
- signature APK,
- publication Play Store.

---

## iOS Release

### Tasks

- build iOS,
- TestFlight,
- App Store.

---

# 24. Milestones

# Milestone 1 — Fondations

## Objectif

Projet Flutter prêt.

### Inclus

- Flutter,
- Firebase,
- architecture,
- thème,
- navigation.

---

# Milestone 2 — MVP Core

## Objectif

Quiz jouable.

### Inclus

- onboarding,
- accueil,
- quiz,
- score,
- résultat.

---

# Milestone 3 — Gamification

## Objectif

Ajouter progression utilisateur.

### Inclus

- XP,
- niveaux,
- badges,
- leaderboard.

---

# Milestone 4 — Stabilisation

## Objectif

Préparer publication.

### Inclus

- tests,
- optimisations,
- corrections bugs,
- analytics.

---

# Milestone 5 — Release

## Objectif

Publication stores.

### Inclus

- Play Store,
- App Store,
- captures,
- description.

---

# 25. Estimation Complexité

| Niveau | Description |
|---|---|
| Simple | rapide |
| Moyen | logique standard |
| Complexe | logique avancée |

---

# Complexité par module

| Module | Complexité |
|---|---|
| Auth | Moyen |
| Quiz Engine | Complexe |
| Firestore | Moyen |
| Leaderboard | Moyen |
| Gamification | Moyen |
| UI/Animations | Moyen |
| Quiz quotidien | Moyen |

---

# 26. Hors Scope V1

Non inclus :

- duel temps réel,
- chat,
- multi-clubs,
- boutique,
- achats intégrés,
- IA temps réel,
- réseau social.

---

# 27. Vision Future

# V2

- duel online,
- amis,
- saisons,
- événements PSG.

---

# V3

- autres clubs,
- football mondial,
- fantasy football,
- communauté.

---

# 28. Philosophie Projet

Le projet doit rester :

- simple,
- propre,
- scalable,
- agréable à maintenir.

Le MVP doit être livré rapidement sans sacrifier la qualité de l’architecture.


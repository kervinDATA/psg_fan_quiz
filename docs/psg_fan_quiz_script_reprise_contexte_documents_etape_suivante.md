# PSG Fan Quiz — Script de Reprise du Projet

## Objectif du script

Ce document sert à expliquer rapidement le contexte du projet **PSG Fan Quiz**, les documents déjà créés, leur rôle, et l’étape suivante à réaliser.

Il peut être utilisé pour :

- reprendre le projet plus tard,
- expliquer le projet à un développeur,
- donner du contexte à un assistant IA,
- préparer le démarrage technique réel.

---

# 1. Contexte général du projet

Le projet s’appelle :

```text
PSG Fan Quiz
```

Il s’agit d’une application mobile de quiz dédiée aux fans du Paris Saint-Germain.

L’objectif principal est de permettre aux utilisateurs de :

- s’amuser,
- tester leurs connaissances sur le PSG,
- apprendre l’histoire du club,
- progresser avec de l’XP,
- débloquer des badges,
- comparer leurs scores avec les autres joueurs.

Le projet cible :

- les fans du PSG,
- les jeunes,
- les adultes,
- principalement en France pour la V1.

Les plateformes prévues sont :

- Android,
- iOS.

La technologie mobile choisie est :

```text
Flutter
```

Le backend recommandé est :

```text
Firebase
```

---

# 2. Vision produit

PSG Fan Quiz ne doit pas être une simple application de quiz statique.

Le bon positionnement est :

```text
Une expérience mobile fun, sportive et immersive pour les vrais fans du PSG.
```

L’application doit mélanger :

- quiz,
- gamification,
- progression,
- compétition,
- apprentissage,
- culture PSG.

La V1 doit rester simple, mais construite proprement pour pouvoir évoluer.

---

# 3. Documents déjà créés

## Document 1 — Spécification Fonctionnelle V1

Nom du document :

```text
PSG Fan Quiz — Spécification Fonctionnelle V1
```

Ce document définit les bases fonctionnelles du produit.

Il contient :

- la présentation du projet,
- les objectifs produit,
- le public cible,
- les plateformes,
- les fonctionnalités V1,
- les catégories de quiz,
- les règles de score,
- le système XP,
- les niveaux,
- les badges,
- le classement,
- le quiz quotidien,
- les écrans principaux,
- les règles générales du MVP.

Ce document répond à la question :

```text
Que doit faire l’application ?
```

---

## Document 2 — Architecture Projet V1

Nom du document :

```text
PSG Fan Quiz — Architecture Projet V1
```

Ce document définit l’architecture globale du projet.

Il contient :

- la vision technique,
- les choix de stack,
- Flutter,
- Firebase,
- Firestore,
- Riverpod,
- GoRouter,
- l’organisation générale du projet,
- les modules fonctionnels,
- la vision long terme,
- les règles de scalabilité.

Ce document répond à la question :

```text
Comment le projet doit être structuré globalement ?
```

---

## Document 3 — Architecture Fonctionnelle V1

Nom du document :

```text
PSG Fan Quiz — Architecture Fonctionnelle V1
```

Ce document détaille les parcours utilisateurs et les écrans.

Il contient :

- le flux global utilisateur,
- le Splash Screen,
- l’Onboarding,
- la création de profil,
- l’accueil,
- les catégories,
- l’écran quiz,
- l’écran résultat,
- le leaderboard,
- le profil,
- le quiz quotidien,
- les règles XP,
- les badges,
- les erreurs,
- les états de chargement.

Ce document répond à la question :

```text
Comment l’utilisateur utilise l’application ?
```

---

## Document 4 — Modèle de Données Firestore V1

Nom du document :

```text
PSG Fan Quiz — Modèle de Données Firestore V1
```

Ce document définit la structure backend Firestore.

Il contient :

- les collections Firestore,
- les champs,
- les types,
- les exemples JSON,
- les relations logiques,
- les règles de nommage,
- les index recommandés,
- les règles de sécurité de base,
- la stratégie de gestion des questions.

Collections principales prévues :

```text
users
questions
quiz_results
categories
badges
daily_quizzes
leaderboard
```

Ce document répond à la question :

```text
Comment les données sont stockées ?
```

---

## Document 5 — Design System V1

Nom du document :

```text
PSG Fan Quiz — Design System V1
```

Ce document définit l’identité visuelle de l’application.

Il contient :

- les couleurs principales,
- le bleu PSG,
- le rouge PSG,
- le blanc,
- le noir,
- les couleurs secondaires,
- la typographie,
- le spacing,
- les boutons,
- les cards,
- la navigation,
- les animations,
- les badges,
- le leaderboard,
- les règles UX.

Couleurs principales :

```text
Bleu PSG : #0A1E5E
Rouge PSG : #D00027
Blanc : #FFFFFF
Noir : #111111
```

Ce document répond à la question :

```text
À quoi doit ressembler l’application ?
```

---

## Document 6 — Backlog MVP & Roadmap

Nom du document :

```text
PSG Fan Quiz — Backlog MVP & Roadmap
```

Ce document transforme la vision en plan de travail produit.

Il contient :

- les epics,
- les features,
- les tasks,
- les priorités,
- les milestones,
- la roadmap V1, V2, V3,
- les modules à développer,
- les éléments obligatoires,
- les éléments optionnels.

Ce document répond à la question :

```text
Quelles sont les tâches à réaliser ?
```

---

## Document 7 — Setup Technique Flutter V1

Nom du document :

```text
PSG Fan Quiz — Setup Technique Flutter V1
```

Ce document définit l’environnement technique.

Il contient :

- installation Flutter,
- VS Code,
- Android Studio,
- Xcode,
- Git,
- Firebase CLI,
- FlutterFire CLI,
- packages Flutter,
- setup Firebase,
- structure du projet,
- conventions techniques,
- commandes utiles.

Ce document répond à la question :

```text
Quel environnement faut-il préparer pour développer ?
```

---

## Document 8 — Wireframes & UX Flows V1

Nom du document :

```text
PSG Fan Quiz — Wireframes & UX Flows V1
```

Ce document décrit les écrans sous forme de wireframes textuels.

Il contient :

- le flux global,
- le wireframe du splash screen,
- le wireframe onboarding,
- le wireframe création profil,
- le wireframe accueil,
- le wireframe catégories,
- le wireframe quiz,
- le wireframe résultat,
- le wireframe leaderboard,
- le wireframe profil,
- la bottom navigation,
- les états UX.

Ce document répond à la question :

```text
Comment les écrans doivent être organisés ?
```

---

## Document 9 — Repository Git & Workflow Dev

Nom du document :

```text
PSG Fan Quiz — Repository Git & Workflow Dev
```

Ce document définit l’organisation Git du projet.

Il contient :

- le nom du repository,
- la structure Git,
- les branches,
- les conventions de commits,
- le workflow de développement,
- le versioning,
- les règles de qualité,
- la gestion des assets,
- la gestion des secrets,
- le workflow release.

Repository recommandé :

```text
psg-fan-quiz
```

Branches recommandées :

```text
main
develop
feature/*
fix/*
```

Ce document répond à la question :

```text
Comment organiser le code et le travail Git ?
```

---

## Document 10 — Architecture Flutter Réelle V1

Nom du document :

```text
PSG Fan Quiz — Architecture Flutter Réelle V1
```

Ce document définit la structure Flutter concrète à implémenter.

Il contient :

- la structure réelle du dossier `lib/`,
- les modules `app`, `core`, `features`, `shared`, `theme`,
- les features principales,
- les datasources,
- les models,
- les repositories,
- les use cases,
- les controllers,
- les providers,
- la navigation GoRouter,
- l’architecture Riverpod,
- le flux Firestore vers UI.

Structure cible :

```text
lib/
├── app/
├── core/
├── features/
├── shared/
├── theme/
└── main.dart
```

Ce document répond à la question :

```text
Comment coder proprement l’application Flutter ?
```

---

## Document 11 — Plan d’Implémentation Technique V1

Nom du document :

```text
PSG Fan Quiz — Plan d’Implémentation Technique V1
```

Ce document définit l’ordre réel de développement.

Il contient :

- la stratégie MVP first,
- les sprints techniques,
- les dépendances,
- l’ordre de développement,
- les validations attendues,
- les risques,
- la stratégie Firestore,
- la stratégie UI,
- la stratégie release.

Ordre global recommandé :

```text
1. Setup projet
2. Architecture Flutter
3. Theme system
4. Navigation
5. Onboarding
6. Home screen
7. Quiz engine
8. Firestore
9. Gamification
10. Leaderboard
11. Profil
12. Tests
13. Release
```

Ce document répond à la question :

```text
Dans quel ordre doit-on développer ?
```

---

## Document 12 — Checklist de Démarrage Projet

Nom du document :

```text
PSG Fan Quiz — Checklist de Démarrage Projet
```

Ce document sert de checklist avant le démarrage réel.

Il contient :

- les comptes nécessaires,
- GitHub,
- Firebase,
- Google Play Console,
- Apple Developer,
- Flutter,
- Android Studio,
- Xcode,
- VS Code,
- Firebase CLI,
- FlutterFire CLI,
- packages Flutter,
- assets,
- questions quiz,
- design system,
- collections Firestore,
- analytics,
- tests initiaux.

Ce document répond à la question :

```text
Sommes-nous prêts à commencer à coder ?
```

---

# 4. Résumé de l’état actuel du projet

À ce stade, le projet est très bien cadré.

Nous avons défini :

- le produit,
- les fonctionnalités,
- l’architecture fonctionnelle,
- l’architecture technique,
- le design system,
- les données Firestore,
- le backlog,
- la roadmap,
- le workflow Git,
- le setup Flutter,
- les wireframes,
- le plan d’implémentation,
- la checklist de démarrage.

Le projet est donc prêt à passer en phase :

```text
BUILD
```

---

# 5. Étape suivante recommandée

L’étape suivante est :

```text
Création réelle du projet Flutter PSG Fan Quiz
```

Cela signifie :

1. créer le repository GitHub,
2. créer le projet Flutter,
3. vérifier que Flutter compile,
4. connecter le projet à Git,
5. installer les packages de base,
6. créer la structure de dossiers officielle,
7. faire le premier commit propre.

---

# 6. Première étape concrète à réaliser

## Étape 1 — Créer le repository GitHub

Nom recommandé :

```text
psg-fan-quiz
```

Branches à créer :

```text
main
develop
```

---

## Étape 2 — Créer le projet Flutter

Commande prévue :

```bash
flutter create psg_fan_quiz
```

Puis entrer dans le projet :

```bash
cd psg_fan_quiz
```

Puis lancer :

```bash
flutter run
```

---

## Étape 3 — Initialiser Git

Commandes prévues :

```bash
git init
git add .
git commit -m "chore: initialize flutter project"
```

Puis connecter au repository distant GitHub.

---

## Étape 4 — Installer les premiers packages

Packages prioritaires :

```text
flutter_riverpod
go_router
firebase_core
firebase_auth
cloud_firestore
google_fonts
flutter_svg
logger
```

---

## Étape 5 — Créer la structure de dossiers

Structure cible :

```text
lib/
├── app/
├── core/
├── features/
├── shared/
├── theme/
└── main.dart
```

---

# 7. Prochaine livraison attendue

La prochaine livraison logique est :

```text
Script de création du projet Flutter PSG Fan Quiz
```

Ce script devra contenir :

- les commandes terminal,
- la création du projet,
- l’installation des packages,
- la création des dossiers,
- le premier commit Git,
- la vérification du projet.

---

# 8. Message de reprise rapide

Si le projet doit être repris dans une nouvelle conversation, utiliser ce résumé :

```text
Je travaille sur PSG Fan Quiz, une application mobile Flutter de quiz dédiée aux fans du Paris Saint-Germain.

Nous avons déjà produit les documents projet suivants :
1. Spécification Fonctionnelle V1
2. Architecture Projet V1
3. Architecture Fonctionnelle V1
4. Modèle de Données Firestore V1
5. Design System V1
6. Backlog MVP & Roadmap
7. Setup Technique Flutter V1
8. Wireframes & UX Flows V1
9. Repository Git & Workflow Dev
10. Architecture Flutter Réelle V1
11. Plan d’Implémentation Technique V1
12. Checklist de Démarrage Projet

La stack retenue est Flutter + Firebase + Firestore + Riverpod + GoRouter.

L’étape suivante est de passer en phase BUILD : créer le projet Flutter, initialiser Git, installer les packages, créer l’architecture de dossiers et faire le premier commit propre.
```

---

# 9. Décision importante

À partir de maintenant, il ne faut plus ajouter trop de documents théoriques.

La priorité est de passer à l’exécution réelle :

```text
Créer le projet Flutter et commencer le développement proprement.
```

---

# 10. Conclusion

Le projet PSG Fan Quiz est suffisamment cadré pour démarrer techniquement.

La prochaine action concrète est :

```text
Créer le projet Flutter PSG Fan Quiz en local.
```


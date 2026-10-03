# PSG Fan Quiz — Checklist de Démarrage Projet

## Version

```text
V1.0
```

---

# 1. Objectif du Document

Ce document sert de checklist officielle avant le démarrage réel du développement de PSG Fan Quiz.

Il permet de vérifier que tous les éléments nécessaires sont prêts avant de créer le projet Flutter et de commencer le développement.

---

# 2. Comptes nécessaires

## GitHub

- [ ] Compte GitHub disponible
- [ ] Repository créé
- [ ] Nom repository défini : `psg-fan-quiz`
- [ ] Branche `main` créée
- [ ] Branche `develop` créée

---

## Firebase / Google

- [ ] Compte Google disponible
- [ ] Projet Firebase créé
- [ ] Nom projet Firebase défini : `psg-fan-quiz`
- [ ] Firebase Authentication activé
- [ ] Cloud Firestore activé
- [ ] Firebase Analytics activé
- [ ] Firebase Crashlytics activé
- [ ] Firebase Cloud Messaging prévu

---

## Stores

### Google Play Console

- [ ] Compte développeur Google Play disponible
- [ ] Accès console vérifié

### Apple Developer

- [ ] Compte Apple Developer disponible
- [ ] Accès App Store Connect vérifié

---

# 3. Environnement de développement

## Flutter

- [ ] Flutter installé
- [ ] Dart installé
- [ ] `flutter doctor` exécuté
- [ ] Aucune erreur critique dans `flutter doctor`

---

## Android

- [ ] Android Studio installé
- [ ] Android SDK installé
- [ ] Android Emulator configuré
- [ ] Un appareil Android physique disponible ou émulateur fonctionnel

---

## iOS

> Nécessite macOS.

- [ ] Xcode installé
- [ ] Simulateur iOS configuré
- [ ] Compte Apple configuré
- [ ] TestFlight prévu

---

## IDE

### Visual Studio Code

- [ ] VS Code installé
- [ ] Extension Flutter installée
- [ ] Extension Dart installée
- [ ] Extension GitLens installée
- [ ] Extension Error Lens installée

---

# 4. Outils CLI

## Git

- [ ] Git installé
- [ ] Identité Git configurée

```bash
git config --global user.name "Votre Nom"
git config --global user.email "votre.email@example.com"
```

---

## FlutterFire CLI

- [ ] FlutterFire CLI installée

```bash
dart pub global activate flutterfire_cli
```

---

## Firebase CLI

- [ ] Firebase CLI installée
- [ ] Connexion Firebase effectuée

```bash
firebase login
```

---

# 5. Création du projet Flutter

## Commande prévue

```bash
flutter create psg_fan_quiz
```

---

## Vérifications

- [ ] Projet créé correctement
- [ ] Application lancée sur Android
- [ ] Application lancée sur iOS si disponible
- [ ] Premier commit Git effectué

---

# 6. Packages Flutter à installer

## Core

- [ ] `flutter_riverpod`
- [ ] `go_router`
- [ ] `freezed`
- [ ] `freezed_annotation`
- [ ] `json_serializable`
- [ ] `json_annotation`

---

## Firebase

- [ ] `firebase_core`
- [ ] `firebase_auth`
- [ ] `cloud_firestore`
- [ ] `firebase_analytics`
- [ ] `firebase_crashlytics`
- [ ] `firebase_messaging`

---

## UI

- [ ] `google_fonts`
- [ ] `flutter_svg`
- [ ] `flutter_animate`

---

## Utilitaires

- [ ] `logger`
- [ ] `intl`

---

# 7. Configuration Firebase

## FlutterFire

- [ ] Exécuter configuration Firebase

```bash
flutterfire configure
```

---

## Plateformes

- [ ] Android connecté à Firebase
- [ ] iOS connecté à Firebase
- [ ] Fichier `firebase_options.dart` généré

---

## Authentication

- [ ] Connexion anonyme activée
- [ ] Stratégie Google/Apple prévue plus tard

---

## Firestore

- [ ] Base Firestore créée
- [ ] Mode production prévu
- [ ] Règles de sécurité initiales configurées

---

# 8. Structure des dossiers à créer

## Structure cible

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

## Features V1

- [ ] `auth`
- [ ] `onboarding`
- [ ] `home`
- [ ] `categories`
- [ ] `quiz`
- [ ] `leaderboard`
- [ ] `profile`

---

# 9. Assets nécessaires

## Logo

- [ ] Logo application défini
- [ ] Logo exporté PNG/SVG
- [ ] Logo adapté splash screen

---

## Icône application

- [ ] Icône Android
- [ ] Icône iOS
- [ ] Icône haute résolution

---

## Avatars

- [ ] Avatars simples V1
- [ ] Avatars au format PNG/SVG

---

## Badges

- [ ] Badges V1 définis
- [ ] Icônes badges préparées

---

## Backgrounds

- [ ] Background bleu PSG
- [ ] Background quiz
- [ ] Background résultat

---

# 10. Contenu Quiz

## Base initiale

- [ ] Minimum 100 questions préparées
- [ ] Questions classées par catégorie
- [ ] Réponses vérifiées
- [ ] Explications rédigées
- [ ] Difficultés définies

---

## Catégories V1

- [ ] Joueurs
- [ ] Entraîneurs
- [ ] Transferts
- [ ] Ligue des Champions
- [ ] Classico
- [ ] Parc des Princes
- [ ] Statistiques
- [ ] Histoire du club

---

## Format questions

- [ ] Format JSON validé
- [ ] Import Firestore prévu

---

# 11. Design System

## Couleurs

- [ ] Bleu PSG : `#0A1E5E`
- [ ] Rouge PSG : `#D00027`
- [ ] Blanc : `#FFFFFF`
- [ ] Noir : `#111111`

---

## Typographie

- [ ] Police Poppins validée
- [ ] Hiérarchie typographique définie

---

## Composants UI

- [ ] Bouton principal
- [ ] Bouton secondaire
- [ ] Card catégorie
- [ ] Card quiz
- [ ] Loader
- [ ] XP progress bar
- [ ] Badge widget

---

# 12. Écrans à développer en premier

## Ordre recommandé

- [ ] Splash Screen
- [ ] Onboarding
- [ ] Création Profil
- [ ] Home Screen
- [ ] Catégories
- [ ] Quiz Screen
- [ ] Résultat Quiz
- [ ] Leaderboard
- [ ] Profil

---

# 13. Firestore — Collections MVP

## Collections à créer

- [ ] `users`
- [ ] `questions`
- [ ] `quiz_results`
- [ ] `leaderboard`
- [ ] `categories`
- [ ] `badges`

---

# 14. Analytics à prévoir

## Events V1

- [ ] `app_open`
- [ ] `quiz_started`
- [ ] `quiz_completed`
- [ ] `category_selected`
- [ ] `badge_unlocked`
- [ ] `level_up`

---

# 15. Tests initiaux

## Android

- [ ] Application démarre
- [ ] Navigation fonctionne
- [ ] Quiz jouable
- [ ] Données Firestore chargées

---

## iOS

- [ ] Application démarre
- [ ] UI correcte
- [ ] Navigation fonctionne
- [ ] Firebase connecté

---

# 16. Publication future

## Android

- [ ] Nom application validé
- [ ] Icône validée
- [ ] Description Play Store rédigée
- [ ] Captures écran préparées

---

## iOS

- [ ] Nom application validé
- [ ] Icône validée
- [ ] Description App Store rédigée
- [ ] Captures écran préparées

---

# 17. Risques à anticiper

| Risque | Action préventive |
|---|---|
| Trop de fonctionnalités | respecter le MVP |
| Questions incorrectes | validation manuelle |
| Firestore mal structuré | suivre modèle de données |
| Design incohérent | suivre design system |
| Projet non maintenable | respecter architecture Flutter |

---

# 18. Définition du prêt à coder

Le projet est prêt à coder lorsque :

- [ ] Flutter est installé
- [ ] GitHub est prêt
- [ ] Firebase est prêt
- [ ] Le projet Flutter compile
- [ ] La structure de dossiers est créée
- [ ] Les premières questions sont disponibles
- [ ] Le design system est validé
- [ ] Le backlog MVP est clair

---

# 19. Prochaine étape après cette checklist

Après validation de cette checklist, la prochaine étape est :

```text
Création réelle du projet Flutter PSG Fan Quiz
```

Puis :

```text
Implémentation du Theme System Flutter
```

---

# 20. Philosophie Finale

Le projet doit démarrer proprement.

Une bonne préparation permet de réduire :

- les bugs,
- les refontes,
- la dette technique,
- les pertes de temps.

L’objectif est de construire une V1 simple, solide et réellement publiable.


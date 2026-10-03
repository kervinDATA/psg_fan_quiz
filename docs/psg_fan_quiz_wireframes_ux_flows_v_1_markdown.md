# PSG Fan Quiz — Wireframes & UX Flows V1

## Version

```text
V1.0
```

---

# 1. Objectif du Document

Ce document définit :

- les wireframes fonctionnels,
- les parcours utilisateurs,
- les flux UX,
- la structure des écrans,
- les interactions principales,
- les comportements UI/UX.

Il sert de référence officielle pour le développement Flutter.

---

# 2. Philosophie UX

# Objectif principal

Créer une expérience :

- rapide,
- fluide,
- immersive,
- addictive,
- pensée mobile-first.

---

# Principes UX

## Simplicité

L’utilisateur doit comprendre immédiatement :

- où cliquer,
- comment jouer,
- comment progresser.

---

## Rapidité

Temps minimal entre :

```text
Ouverture application → lancement quiz
```

---

## Feedback constant

L’utilisateur doit toujours voir :

- son score,
- son XP,
- sa progression,
- ses récompenses.

---

# 3. UX Flow Global

# Flux principal

```text
Splash
    ↓
Onboarding
    ↓
Création Profil
    ↓
Accueil
    ↓
Choix Catégorie
    ↓
Quiz
    ↓
Résultat
    ↓
Retour Accueil
```

---

# Flux secondaire

```text
Accueil
    ↓
Profil
```

---

# Flux leaderboard

```text
Accueil
    ↓
Classement
```

---

# 4. Wireframe — Splash Screen

# Objectif

Créer une première impression forte.

---

# Structure

```text
┌─────────────────────┐
│                     │
│                     │
│      LOGO PSG       │
│     FAN QUIZ        │
│                     │
│     Loading...      │
│                     │
│                     │
└─────────────────────┘
```

---

# Éléments

| Élément | Description |
|---|---|
| Logo | centré |
| Background | bleu PSG |
| Loader | animation légère |

---

# UX Rules

- chargement rapide,
- animation fluide,
- maximum 2 secondes.

---

# 5. Wireframe — Onboarding

# Objectif

Présenter rapidement la valeur produit.

---

# Structure

```text
┌─────────────────────┐
│                     │
│   Illustration      │
│                     │
│ Teste tes           │
│ connaissances       │
│ sur le PSG          │
│                     │
│     ● ○ ○           │
│                     │
│    [Suivant]        │
│                     │
└─────────────────────┘
```

---

# Slides prévues

| Slide | Message |
|---|---|
| 1 | Teste tes connaissances PSG |
| 2 | Gagne de l’XP |
| 3 | Deviens une légende parisienne |

---

# UX Rules

- swipe autorisé,
- animations fluides,
- CTA visible,
- onboarding court.

---

# 6. Wireframe — Création Profil

# Objectif

Créer rapidement un profil.

---

# Structure

```text
┌─────────────────────┐
│                     │
│   Choisis ton       │
│      pseudo         │
│                     │
│ [_______________]   │
│                     │
│   Choisis avatar    │
│                     │
│  ○ ○ ○ ○ ○ ○ ○      │
│                     │
│      [Jouer]        │
│                     │
└─────────────────────┘
```

---

# UX Rules

- saisie rapide,
- peu de friction,
- validation instantanée.

---

# Erreurs

| Cas | Message |
|---|---|
| pseudo vide | pseudo requis |
| pseudo trop court | minimum 3 caractères |

---

# 7. Wireframe — Home Screen

# Objectif

Créer le hub principal utilisateur.

---

# Structure

```text
┌─────────────────────┐
│ Salut Kervin        │
│ Niveau 7 • 1250 XP  │
│                     │
│ [QUIZ DU JOUR]      │
│                     │
│ Catégories          │
│                     │
│ [Joueurs]           │
│ [Classico]          │
│ [LDC]               │
│ [Statistiques]      │
│                     │
│ Navigation Bottom   │
└─────────────────────┘
```

---

# Sections principales

| Section | Usage |
|---|---|
| Header utilisateur | progression |
| Quiz quotidien | rétention |
| Catégories | navigation quiz |
| Navigation bottom | accès rapide |

---

# UX Rules

- accès quiz rapide,
- interface claire,
- progression visible immédiatement.

---

# 8. Wireframe — Catégories

# Objectif

Choisir un thème de quiz.

---

# Structure

```text
┌─────────────────────┐
│     Catégories      │
│                     │
│ [ Joueurs ]         │
│ [ Entraîneurs ]     │
│ [ Classico ]        │
│ [ LDC ]             │
│ [ Parc ]            │
│ [ Stats ]           │
│                     │
└─────────────────────┘
```

---

# UX Rules

- cards larges,
- très cliquables,
- design gaming/sport.

---

# 9. Wireframe — Quiz Screen

# Objectif

Maximiser concentration et engagement.

---

# Structure

```text
┌─────────────────────┐
│ Question 3/10       │
│ Temps : 08s         │
│ Score : 80          │
│                     │
│ Quel joueur... ?    │
│                     │
│ [ Réponse A ]       │
│ [ Réponse B ]       │
│ [ Réponse C ]       │
│ [ Réponse D ]       │
│                     │
└─────────────────────┘
```

---

# Priorités UX

| Élément | Priorité |
|---|---|
| Question | maximale |
| Réponses | accessibles |
| Timer | visible |
| Score | secondaire |

---

# Feedback UX

## Bonne réponse

- animation verte,
- vibration légère,
- transition fluide.

---

## Mauvaise réponse

- animation rouge,
- vibration légère.

---

# Timer

## Comportement

- animation circulaire,
- couleur rouge fin timer.

---

# 10. Wireframe — Résultat Quiz

# Objectif

Créer une sensation de récompense.

---

# Structure

```text
┌─────────────────────┐
│     SCORE FINAL     │
│                     │
│        180          │
│                     │
│ +150 XP             │
│                     │
│ 8/10 bonnes         │
│ réponses            │
│                     │
│ [Rejouer]           │
│ [Accueil]           │
│                     │
└─────────────────────┘
```

---

# UX Rules

- score très visible,
- animation récompense,
- dopamine rapide.

---

# Animations prévues

| Animation | Usage |
|---|---|
| compteur score | progression |
| confetti | badge gagné |
| glow XP | récompense |

---

# 11. Wireframe — Leaderboard

# Objectif

Créer un esprit compétition.

---

# Structure

```text
┌─────────────────────┐
│     LEADERBOARD     │
│                     │
│ 🥇 Player1          │
│ 🥈 Player2          │
│ 🥉 Player3          │
│                     │
│ #12 Kervin          │
│                     │
└─────────────────────┘
```

---

# UX Rules

- podium visible,
- utilisateur toujours visible,
- progression mise en avant.

---

# 12. Wireframe — Profil

# Objectif

Afficher progression utilisateur.

---

# Structure

```text
┌─────────────────────┐
│      Avatar         │
│       Kervin        │
│                     │
│ Niveau 7            │
│ XP : 1250           │
│                     │
│ Badges              │
│ ○ ○ ○ ○             │
│                     │
│ Historique          │
│ Quiz récents        │
│                     │
└─────────────────────┘
```

---

# Sections

| Section | Usage |
|---|---|
| avatar | identité |
| niveau | progression |
| badges | récompenses |
| historique | engagement |

---

# 13. Bottom Navigation

# Structure

```text
┌─────────────────────┐
│ Home Quiz Rank Me   │
└─────────────────────┘
```

---

# Onglets

| Onglet | Usage |
|---|---|
| Home | accueil |
| Quiz | catégories |
| Rank | leaderboard |
| Me | profil |

---

# UX Rules

- toujours visible,
- navigation simple,
- icônes modernes.

---

# 14. UX Feedback System

# Objectif

Toujours donner un retour visuel.

---

# Types feedback

| Type | Comportement |
|---|---|
| Success | vert |
| Error | rouge |
| XP gain | jaune |
| Badge | animation premium |
| Loading | loader fluide |

---

# 15. États UX

# Loading State

## Objectif

Éviter écran vide.

---

# Error State

## Objectif

Afficher erreur claire.

---

# Empty State

## Objectif

Informer utilisateur.

---

# Success State

## Objectif

Créer satisfaction utilisateur.

---

# 16. Responsive Design

# Compatibilité

- Android,
- iPhone,
- petits écrans,
- grands écrans.

---

# Règles

- composants flexibles,
- éviter tailles fixes,
- spacing adaptatif.

---

# 17. Performance UX

# Objectifs

- navigation fluide,
- animations rapides,
- chargement optimisé.

---

# Règles

- éviter écrans lourds,
- lazy loading futur,
- optimisation Firestore.

---

# 18. Accessibilité

# Objectifs

- contraste élevé,
- boutons larges,
- texte lisible.

---

# Minimums

| Élément | Taille |
|---|---|
| Texte | 14px |
| Boutons | 48px |

---

# 19. Vision Future UX

# V2

- duel online,
- animations premium,
- quiz live,
- profils avancés.

---

# V3

- personnalisation avancée,
- thèmes PSG,
- saisons spéciales,
- événements Champions League.

---

# 20. Philosophie UX Finale

PSG Fan Quiz doit offrir :

- une expérience rapide,
- fun,
- moderne,
- sportive,
- addictive,
- pensée mobile-first.

L’utilisateur doit avoir envie de :

```text
revenir chaque jour
```


# Spécification Fonctionnelle V1 — PSG Fan Quiz

## Version

```text
V1.0
```

---

# 1. Présentation du Projet

## Nom

```text
PSG Fan Quiz
```

---

## Description

PSG Fan Quiz est une application mobile de quiz dédiée aux fans du Paris Saint-Germain.

L’application permet aux utilisateurs de :

- tester leurs connaissances,
- apprendre l’histoire du club,
- gagner des points,
- progresser en niveau,
- débloquer des badges,
- comparer leurs scores avec les autres joueurs.

---

# 2. Objectifs Produit

## Objectif principal

Créer une application mobile fun, rapide et engageante pour les supporters du PSG.

---

## Objectifs secondaires

- augmenter la rétention utilisateur,
- créer une expérience addictive,
- valoriser la culture PSG,
- encourager les joueurs à revenir quotidiennement.

---

# 3. Public Cible

## Cible principale

- fans du PSG,
- jeunes adultes,
- adultes,
- utilisateurs français.

---

# 4. Plateformes

## V1

- Android
- iOS

---

# 5. Stack Technique

## Frontend

```text
Flutter
```

## Backend

```text
Firebase
```

## Base de données

```text
Cloud Firestore
```

---

# 6. Fonctionnalités V1

# 6.1 Utilisateur

## Fonctionnalités

### Création rapide de profil

L’utilisateur :
- choisit un pseudo,
- choisit un avatar simple,
- commence immédiatement à jouer.

---

## Données utilisateur

Chaque utilisateur possède :

- pseudo,
- avatar,
- XP,
- niveau,
- score total,
- badges,
- historique de quiz.

---

# 6.2 Quiz

## Types de questions

### QCM

Exemple :

> Quel joueur est le meilleur buteur de l’histoire du PSG ?

- Mbappé
- Cavani
- Ibrahimović
- Neymar

---

### Vrai / Faux

Exemple :

> Ronaldinho a joué au PSG.

- Vrai
- Faux

---

### Chrono

Questions avec temps limité.

Exemple :
- 10 secondes par question.

---

### Devinettes

Exemple :

> J’ai porté le numéro 10 et gagné plusieurs titres avec Paris.

---

# 6.3 Catégories

## Liste V1

- Joueurs
- Entraîneurs
- Transferts
- Ligue des Champions
- Classico
- Parc des Princes
- Statistiques
- Histoire du club

---

# 6.4 Système de Score

## Attribution des points

### Bonne réponse

```text
+10 points
```

---

### Mauvaise réponse

```text
0 point
```

---

### Bonus chrono

Réponse rapide :

```text
+5 points bonus
```

---

## Score final

Calculé selon :
- bonnes réponses,
- rapidité,
- difficulté.

---

# 6.5 Système XP

## Gain XP

Exemple :

| Action | XP |
|---|---|
| Quiz terminé | +50 |
| Victoire | +100 |
| Série parfaite | +150 |
| Quiz quotidien | +75 |

---

# 6.6 Niveaux

## Exemple progression

| Niveau | XP |
|---|---|
| 1 | 0 |
| 2 | 200 |
| 3 | 500 |
| 4 | 1000 |
| 5 | 2000 |

---

## Titres utilisateurs

| Niveau | Titre |
|---|---|
| 1 | Nouveau supporter |
| 3 | Parisien confirmé |
| 5 | Expert PSG |
| 10 | Légende parisienne |

---

# 6.7 Badges

## Exemples

| Badge | Condition |
|---|---|
| Historien PSG | 100% quiz histoire |
| Expert Classico | 10 victoires Classico |
| Roi du Parc | 50 quiz joués |
| Machine Rouge & Bleu | série de 7 jours |

---

# 6.8 Classement

## Classement global

Affichage :
- pseudo,
- niveau,
- score,
- position.

---

## Tri

Par :
- score total,
- XP,
- meilleurs scores.

---

# 6.9 Quiz Quotidien

## Fonctionnement

Chaque jour :
- un quiz spécial disponible,
- récompense bonus,
- XP supplémentaire.

---

# 7. Parcours Utilisateur

# 7.1 Premier lancement

## Étapes

### 1. Splash Screen

Affichage :
- logo,
- chargement.

---

### 2. Onboarding

Présentation :
- concept,
- gamification,
- progression.

---

### 3. Création profil

Utilisateur :
- choisit pseudo,
- choisit avatar.

---

### 4. Accueil

Accès :
- jouer,
- catégories,
- classement,
- profil.

---

# 7.2 Parcours Quiz

## Étapes

### 1. Choix catégorie

Exemple :
- Joueurs
- Ligue des Champions

---

### 2. Lancement quiz

Affichage :
- timer,
- score,
- progression.

---

### 3. Réponse question

Utilisateur sélectionne :
- une réponse,
- validation automatique.

---

### 4. Résultat final

Affichage :
- score,
- XP gagné,
- bonnes réponses,
- badge débloqué.

---

# 8. Écrans V1

# 8.1 Splash Screen

## Contenu

- logo PSG Fan Quiz,
- animation légère,
- chargement.

---

# 8.2 Onboarding

## Slides

### Slide 1

```text
Teste tes connaissances sur le PSG
```

### Slide 2

```text
Gagne de l’XP et monte en niveau
```

### Slide 3

```text
Deviens une légende parisienne
```

---

# 8.3 Accueil

## Contenu

- niveau utilisateur,
- XP,
- bouton jouer,
- quiz du jour,
- catégories,
- classement,
- profil.

---

# 8.4 Écran Quiz

## Contenu

- question,
- réponses,
- timer,
- score actuel,
- progression.

---

# 8.5 Résultat Quiz

## Contenu

- score final,
- XP gagné,
- badge obtenu,
- statistiques.

---

# 8.6 Classement

## Contenu

- top joueurs,
- position utilisateur,
- niveaux.

---

# 8.7 Profil

## Contenu

- pseudo,
- avatar,
- badges,
- historique,
- statistiques.

---

# 9. Design System

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
- dynamique.

---

## Animations

- transitions fluides,
- animations score,
- effets XP,
- animations badges.

---

# 10. Structure des Questions

## Format JSON

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

# 11. Base de Données Firestore

# Collections principales

## users

```text
Utilisateurs
```

---

## questions

```text
Questions des quiz
```

---

## quiz_results

```text
Résultats des quiz
```

---

## leaderboard

```text
Classements
```

---

# 12. Analytics V1

## Données suivies

- nombre de quiz lancés,
- temps moyen,
- catégories populaires,
- taux de rétention,
- utilisateurs actifs.

---

# 13. Notifications Push V1

## Exemples

### Quiz quotidien

```text
Le quiz du jour PSG est disponible !
```

### Série quotidienne

```text
Tu vas perdre ta série de victoires !
```

---

# 14. Sécurité

## V1

- Firebase sécurisé,
- validation des données,
- protection Firestore,
- limitation spam.

---

# 15. Hors Scope V1

Non inclus :

- duel temps réel,
- chat,
- achats intégrés,
- boutique,
- multi-clubs,
- réseau social,
- IA intégrée temps réel.

---

# 16. Roadmap Future

## V2

- duel en ligne,
- amis,
- quiz live,
- événements spéciaux,
- saisons,
- récompenses.

---

## V3

- autres clubs,
- Ligue 1,
- football mondial,
- fantasy football,
- mode carrière fan.


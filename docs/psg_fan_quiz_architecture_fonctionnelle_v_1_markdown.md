# PSG Fan Quiz — Architecture Fonctionnelle V1

## Version

```text
V1.0
```

---

# 1. Objectif du Document

Ce document décrit l’architecture fonctionnelle complète de la version V1 de l’application mobile PSG Fan Quiz.

Il définit :

- les écrans,
- les parcours utilisateur,
- les composants fonctionnels,
- les comportements attendus,
- les règles métier,
- les interactions utilisateur.

---

# 2. Vision Fonctionnelle

## Objectif Produit

Créer une application mobile de quiz immersive et addictive pour les fans du Paris Saint-Germain.

L’utilisateur doit pouvoir :

- jouer rapidement,
- progresser,
- apprendre,
- gagner de l’XP,
- débloquer des badges,
- se comparer aux autres joueurs.

---

# 3. Parcours Utilisateur Global

# Flux principal

```text
Splash Screen
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

# 4. Écran — Splash Screen

# Objectif

- charger l’application,
- initialiser Firebase,
- vérifier utilisateur existant.

---

# Composants

## Logo

```text
PSG Fan Quiz
```

---

## Loader

Animation de chargement.

---

# Comportement

## Si utilisateur déjà existant

Navigation automatique vers :

```text
Accueil
```

---

## Sinon

Navigation vers :

```text
Onboarding
```

---

# 5. Écran — Onboarding

# Objectif

Présenter rapidement l’application.

---

# Slides

## Slide 1

```text
Teste tes connaissances sur le PSG
```

---

## Slide 2

```text
Gagne de l’XP et monte en niveau
```

---

## Slide 3

```text
Deviens une légende parisienne
```

---

# Boutons

## Suivant

Passe au slide suivant.

---

## Commencer

Navigation vers :

```text
Création Profil
```

---

# 6. Écran — Création Profil

# Objectif

Créer rapidement un profil joueur.

---

# Champs

## Pseudo

### Règles

- obligatoire,
- minimum 3 caractères,
- maximum 20 caractères.

---

## Avatar

Choix parmi avatars prédéfinis.

---

# Bouton

## Jouer

Actions :

- création utilisateur,
- sauvegarde Firestore,
- navigation Accueil.

---

# Gestion erreurs

## Pseudo invalide

Message :

```text
Pseudo invalide
```

---

## Erreur réseau

Message :

```text
Connexion impossible
```

---

# 7. Écran — Accueil

# Objectif

Point central de navigation.

---

# Composants

## Header utilisateur

Affichage :

- pseudo,
- niveau,
- XP,
- avatar.

---

## Bouton Quiz du jour

Navigation :

```text
Quiz quotidien
```

---

## Bouton Jouer

Navigation :

```text
Catégories
```

---

## Bouton Classement

Navigation :

```text
Leaderboard
```

---

## Bouton Profil

Navigation :

```text
Profil
```

---

# Comportements

## Chargement données utilisateur

Chargement :

- XP,
- badges,
- score,
- progression.

---

# 8. Écran — Catégories

# Objectif

Choisir un thème de quiz.

---

# Liste catégories

- Joueurs
- Entraîneurs
- Transferts
- Ligue des Champions
- Classico
- Parc des Princes
- Statistiques
- Histoire du club

---

# Comportement

## Sélection catégorie

Actions :

- chargement questions,
- lancement quiz.

---

# 9. Écran — Quiz

# Objectif

Faire jouer l’utilisateur.

---

# Composants

## Question

Affichage texte question.

---

## Réponses

Selon type :

- QCM,
- vrai/faux,
- devinette.

---

## Timer

Affichage temps restant.

---

## Progression

Exemple :

```text
Question 3/10
```

---

## Score actuel

Affichage score en temps réel.

---

# Comportements

## Bonne réponse

Actions :

- ajout points,
- animation validation,
- question suivante.

---

## Mauvaise réponse

Actions :

- animation erreur,
- question suivante.

---

## Fin timer

Actions :

- réponse échouée,
- question suivante.

---

## Fin quiz

Navigation :

```text
Résultat Quiz
```

---

# Règles métier

## Score réponse correcte

```text
+10 points
```

---

## Bonus chrono

```text
+5 points
```

---

# 10. Écran — Résultat Quiz

# Objectif

Afficher les performances utilisateur.

---

# Composants

## Score final

Affichage score total.

---

## XP gagné

Affichage XP gagné.

---

## Bonnes réponses

Exemple :

```text
8/10 bonnes réponses
```

---

## Badge débloqué

Affichage badge si obtenu.

---

# Boutons

## Rejouer

Relance quiz.

---

## Retour accueil

Navigation Accueil.

---

# Comportements

## Sauvegarde résultats

Sauvegarde :

- score,
- XP,
- historique,
- leaderboard.

---

# 11. Écran — Leaderboard

# Objectif

Afficher les meilleurs joueurs.

---

# Composants

## Classement

Affichage :

- position,
- pseudo,
- niveau,
- score.

---

# Tri

Tri par :

- score total,
- XP.

---

# 12. Écran — Profil

# Objectif

Afficher les statistiques utilisateur.

---

# Composants

## Informations utilisateur

- pseudo,
- avatar,
- niveau,
- XP.

---

## Statistiques

- quiz joués,
- bonnes réponses,
- score total,
- meilleur score.

---

## Badges

Liste badges débloqués.

---

## Historique

Liste derniers quiz.

---

# 13. Quiz Quotidien

# Objectif

Créer une rétention quotidienne.

---

# Fonctionnement

Chaque jour :

- un quiz spécial,
- récompense bonus,
- XP supplémentaire.

---

# Restrictions

## Une seule participation par jour

Validation via Firestore.

---

# 14. Système XP

# Sources XP

| Action | XP |
|---|---|
| Quiz terminé | +50 |
| Victoire | +100 |
| Série parfaite | +150 |
| Quiz quotidien | +75 |

---

# Progression niveaux

| Niveau | XP |
|---|---|
| 1 | 0 |
| 2 | 200 |
| 3 | 500 |
| 4 | 1000 |
| 5 | 2000 |

---

# 15. Badges

# Exemples

| Badge | Condition |
|---|---|
| Historien PSG | 100% quiz histoire |
| Expert Classico | 10 victoires Classico |
| Roi du Parc | 50 quiz joués |
| Machine Rouge & Bleu | série de 7 jours |

---

# 16. Notifications Push

# Cas d’usage

## Quiz quotidien

```text
Le quiz du jour PSG est disponible !
```

---

## Série quotidienne

```text
Tu vas perdre ta série !
```

---

## Nouveau badge

```text
Nouveau badge débloqué !
```

---

# 17. Gestion des États

# États de chargement

- loading,
- success,
- error,
- empty.

---

# États quiz

- not_started,
- in_progress,
- completed,
- failed.

---

# 18. Gestion des Erreurs

# Erreurs réseau

Message :

```text
Connexion impossible
```

---

# Erreur chargement quiz

Message :

```text
Impossible de charger le quiz
```

---

# Erreur sauvegarde

Message :

```text
Erreur de sauvegarde
```

---

# 19. Performance UX

# Objectifs

- navigation fluide,
- temps de chargement réduit,
- animations rapides,
- expérience mobile moderne.

---

# 20. Hors Scope V1

Non inclus :

- duel temps réel,
- chat,
- multi-clubs,
- boutique,
- achats intégrés,
- IA temps réel,
- mode social avancé.

---

# 21. Vision Future

# V2

- duel online,
- amis,
- saisons,
- événements spéciaux.

---

# V3

- autres clubs,
- football mondial,
- fantasy football,
- mode carrière fan.


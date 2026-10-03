# PSG Fan Quiz — Design System V1

## Version

```text
V1.0
```

---

# 1. Objectif du Document

Ce document définit le Design System officiel de l’application mobile PSG Fan Quiz.

Il sert de référence pour :

- l’identité visuelle,
- l’UX,
- les composants UI,
- les règles de design,
- les animations,
- la cohérence graphique,
- la future implémentation Flutter.

---

# 2. Vision Design

# Objectif

Créer une expérience :

- moderne,
- immersive,
- sportive,
- dynamique,
- premium,
- inspirée du football et du PSG.

---

# Ambiance recherchée

## Inspirations

- stade de football,
- Ligue des Champions,
- gaming moderne,
- néons,
- cartes FUT,
- interfaces sportives premium.

---

# Émotions recherchées

L’utilisateur doit ressentir :

- excitation,
- compétition,
- progression,
- récompense,
- immersion PSG.

---

# 3. Palette de Couleurs

# Couleurs principales

## Bleu PSG

```text
#0A1E5E
```

Usage :
- couleur principale,
- header,
- background,
- navigation.

---

## Rouge PSG

```text
#D00027
```

Usage :
- CTA,
- boutons importants,
- score,
- highlights.

---

## Blanc

```text
#FFFFFF
```

Usage :
- texte principal,
- cartes,
- éléments UI.

---

## Noir profond

```text
#111111
```

Usage :
- background sombre,
- contraste,
- overlays.

---

# Couleurs secondaires

## Gris foncé

```text
#1F2937
```

---

## Gris clair

```text
#9CA3AF
```

---

## Vert succès

```text
#22C55E
```

---

## Rouge erreur

```text
#EF4444
```

---

## Jaune XP

```text
#FACC15
```

---

# 4. Typographie

# Police principale

## Recommandation

```text
Poppins
```

---

# Pourquoi

- moderne,
- sportive,
- lisible,
- excellente mobile.

---

# Hiérarchie typographique

| Usage | Taille | Poids |
|---|---|---|
| H1 | 32 | Bold |
| H2 | 24 | SemiBold |
| H3 | 20 | SemiBold |
| Body | 16 | Regular |
| Small | 14 | Regular |
| Caption | 12 | Medium |

---

# 5. Spacing System

# Base spacing

```text
8px
```

---

# Échelle

| Valeur | Usage |
|---|---|
| 4 | très petit spacing |
| 8 | spacing standard |
| 16 | blocs UI |
| 24 | sections |
| 32 | grands espaces |
| 48 | séparation majeure |

---

# 6. Radius System

# Border Radius

| Élément | Radius |
|---|---|
| Small | 8 |
| Medium | 16 |
| Large | 24 |
| Cards premium | 32 |

---

# 7. Ombres et Elevation

# Style général

UI moderne avec :

- ombres douces,
- profondeur légère,
- effet premium.

---

# Intensité

## Cards

```text
Faible à moyenne
```

---

## Modals

```text
Moyenne à forte
```

---

# 8. Style des Boutons

# Bouton Principal

## Style

- fond rouge PSG,
- texte blanc,
- radius medium,
- légère ombre.

---

## États

| État | Comportement |
|---|---|
| Normal | standard |
| Hover | légère luminosité |
| Pressed | réduction légère |
| Disabled | opacité réduite |

---

# Bouton Secondaire

## Style

- fond transparent,
- bordure blanche,
- texte blanc.

---

# 9. Style des Cards

# Objectif

Créer des cartes modernes type gaming/sport.

---

# Caractéristiques

- fond sombre,
- radius large,
- légère transparence,
- bordure subtile,
- effet profondeur.

---

# Utilisations

- catégories,
- quiz,
- badges,
- leaderboard,
- profil.

---

# 10. Navigation

# Structure V1

## Navigation principale

```text
Bottom Navigation Bar
```

---

# Onglets

| Onglet | Icône |
|---|---|
| Accueil | home |
| Quiz | sports_esports |
| Classement | leaderboard |
| Profil | person |

---

# Style navigation

- fond sombre,
- icônes blanches,
- élément actif rouge PSG.

---

# 11. Écrans

# Splash Screen

## Objectif

Créer une première impression forte.

---

# Éléments

- logo centré,
- animation légère,
- fond bleu PSG.

---

# Onboarding

## Style

- plein écran,
- illustrations football,
- textes motivants,
- transitions fluides.

---

# Home Screen

## Structure

Sections :

- header utilisateur,
- quiz quotidien,
- catégories,
- progression,
- leaderboard rapide.

---

# Quiz Screen

## Priorités UX

- lisibilité maximale,
- focus question,
- réponses accessibles,
- timer visible,
- feedback immédiat.

---

# Result Screen

## Objectif

Créer une sensation de récompense.

---

# Éléments

- score animé,
- XP gagné,
- badge,
- statistiques.

---

# Leaderboard Screen

## Style

- podium top 3,
- cartes utilisateurs,
- mise en avant niveau.

---

# Profile Screen

## Éléments

- avatar,
- badges,
- progression,
- statistiques,
- historique.

---

# 12. Animations

# Philosophie

Animations rapides et fluides.

---

# Objectifs

- dynamisme,
- feedback utilisateur,
- sensation premium.

---

# Animations prévues

| Animation | Usage |
|---|---|
| Fade | transitions |
| Scale | boutons |
| Slide | navigation |
| Pulse | quiz quotidien |
| Confetti | badge gagné |
| XP animation | progression |

---

# Durée animations

## Standard

```text
200ms à 400ms
```

---

# 13. Icônes

# Librairie recommandée

```text
Material Symbols Rounded
```

---

# Style

- moderne,
- arrondi,
- cohérent mobile.

---

# 14. Responsive Mobile

# Objectifs

Compatibilité :

- petits smartphones,
- grands smartphones,
- Android,
- iPhone.

---

# Approche

- UI flexible,
- composants adaptatifs,
- éviter tailles fixes.

---

# 15. Accessibilité

# Objectifs

- bonne lisibilité,
- contraste élevé,
- boutons accessibles,
- texte lisible.

---

# Taille minimale texte

```text
14px
```

---

# Taille minimale boutons

```text
48px
```

---

# 16. Feedback Utilisateur

# Réponse correcte

- animation verte,
- vibration légère,
- son optionnel.

---

# Réponse incorrecte

- animation rouge,
- vibration légère.

---

# Gain XP

- animation montée XP,
- effet lumineux.

---

# Badge débloqué

- popup spéciale,
- animation premium.

---

# 17. Design des Badges

# Style

- inspiration trophées football,
- métal,
- néons,
- premium gaming.

---

# Catégories visuelles

| Type | Couleur |
|---|---|
| Bronze | marron/orange |
| Argent | gris |
| Or | jaune |
| Légendaire | bleu/néon |

---

# 18. Design du Leaderboard

# Objectif

Créer un esprit compétition.

---

# Top 3

## Mise en avant spéciale

- plus grand,
- glow,
- animation légère.

---

# Position utilisateur

Toujours visible.

---

# 19. Performance UX

# Objectifs

- app fluide,
- chargements rapides,
- navigation instantanée.

---

# Règles

- limiter écrans lourds,
- lazy loading,
- optimisation Firestore.

---

# 20. Vision Future

# V2

- thèmes dynamiques,
- mode nuit avancé,
- animations premium,
- avatars évolutifs.

---

# V3

- personnalisation profil,
- skins,
- thèmes événements PSG,
- saison Ligue des Champions.


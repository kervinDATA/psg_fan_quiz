import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';
import 'app_radius.dart';

class AppTheme {
  AppTheme._();

  // Thème Sombre Officiel - PSG Fan Quiz V1
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      
      // Configuration de la couleur d'arrière-plan globale (Esprit Stade de nuit)
      scaffoldBackgroundColor: AppColors.noirProfond,
      
      // Palette de couleurs structurelle
      colorScheme: const ColorScheme.dark(
        primary: AppColors.bleuPSG,
        secondary: AppColors.rougePSG,
        surface: AppColors.grisFonce,
        error: AppColors.rougeErreur,
      ),

      // Configuration par défaut des bordures et styles de cartes
      cardTheme: CardTheme(
        color: AppColors.grisFonce,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.m, // Utilisation de l'arrondi Medium (16px)
        ),
      ),

      // Style par défaut des boutons principaux de l'application (Rouge PSG)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.rougePSG,
          foregroundColor: AppColors.blanc,
          textStyle: AppTypography.body.copyWith(fontWeight: FontWeight.bold),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.m,
          ),
          elevation: 3.0,
        ),
      ),

      // Configuration globale des barres d'applications (AppBar)
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.bleuPSG,
        foregroundColor: AppColors.blanc,
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
}
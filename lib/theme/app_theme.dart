import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';
import 'app_radius.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.noirProfond,
      
      colorScheme: const ColorScheme.dark(
        primary: AppColors.bleuPSG,
        secondary: AppColors.rougePSG,
        surface: AppColors.grisFonce,
        error: AppColors.rougeErreur,
      ),

      cardTheme: CardThemeData(
        color: AppColors.grisFonce,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.m,
        ),
      ),

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

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.bleuPSG,
        foregroundColor: AppColors.blanc,
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
}
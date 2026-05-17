import 'package:flutter/material.dart';

class AppSpacing {
  AppSpacing._();

  static const double tresPetit = 4.0;
  static const double standard = 8.0;
  static const double blocsUI = 16.0;
  static const double sections = 24.0;
  static const double grandsEspaces = 32.0;
  static const double separationMajeure = 48.0;

  // Raccourcis pratiques pour les espacements (SizedBox) [cite: 220]
  static const SizedBox h4 = SizedBox(height: tresPetit);
  static const SizedBox h8 = SizedBox(height: standard);
  static const SizedBox h16 = SizedBox(height: blocsUI);
  static const SizedBox h24 = SizedBox(height: sections);
  static const SizedBox h32 = SizedBox(height: grandsEspaces);
  
  static const SizedBox w4 = SizedBox(width: tresPetit);
  static const SizedBox w8 = SizedBox(width: standard);
  static const SizedBox w16 = SizedBox(width: blocsUI);
  static const SizedBox w24 = SizedBox(width: sections);
}
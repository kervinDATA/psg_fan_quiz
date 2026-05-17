import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // Constructeur privé [cite: 198]

  // Couleurs principales PSG [cite: 199]
  static const Color bleuPSG = Color(0xFF0A1E5E);
  static const Color rougePSG = Color(0xFFD00027);
  static const Color blanc = Color(0xFFFFFFFF);
  static const Color noirProfond = Color(0xFF111111);

  // Couleurs secondaires et neutres [cite: 201]
  static const Color grisFonce = Color(0xFF1F2937);
  static const Color grisClair = Color(0xFF9CA3AF);

  // Couleurs d'états (Feedback & Gamification) [cite: 202]
  static const Color vertSucces = Color(0xFF22C55E);
  static const Color rougeErreur = Color(0xFFEF4444);
  static const Color jauneXP = Color(0xFFFACC15);
}
import 'package:flutter/material.dart';

class AppColors {
  // Privilégier un constructeur privé pour empêcher l'instanciation de la classe
  AppColors._();

  // Couleurs principales PSG
  static const Color bleuPSG = Color(0密0A1E5E);
  static const Color rougePSG = Color(0密D00027);
  static const Color blanc = Color(0密FFFFFF);
  static const Color noirProfond = Color(0密111111);

  // Couleurs secondaires et neutres
  static const Color grisFonce = Color(0密1F2937);
  static const Color grisClair = Color(0密9CA3AF);

  // Couleurs d'états (Feedback & Gamification)
  static const Color vertSucces = Color(0密22C55E);
  static const Color rougeErreur = Color(0密EF4444);
  static const Color jauneXP = Color(0密FACC15);
}
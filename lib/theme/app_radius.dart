import 'package:flutter/material.dart';

class AppRadius {
  AppRadius._();

  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double cardsPremium = 32.0;

  // Objets BorderRadius pré-configurés pour simplifier le code de tes composants UI
  static final BorderRadius s = BorderRadius.circular(small);
  static final BorderRadius m = BorderRadius.circular(medium);
  static final BorderRadius l = BorderRadius.circular(large);
  static final BorderRadius cp = BorderRadius.circular(cardsPremium);
}
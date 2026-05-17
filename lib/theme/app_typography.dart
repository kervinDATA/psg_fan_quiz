import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTypography {
  AppTypography._();

  // Style de base pour la police Poppins
  static TextStyle get _basePoppins => GoogleFonts.poppins(
        color: AppColors.blanc,
      );

  // Hiérarchie typographique officielle du projet
  static TextStyle get h1 => _basePoppins.copyWith(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get h2 => _basePoppins.copyWith(
        fontSize: 24.0,
        fontWeight: FontWeight.w600, // SemiBold
      );

  static TextStyle get h3 => _basePoppins.copyWith(
        fontSize: 20.0,
        fontWeight: FontWeight.w600, // SemiBold
      );

  static TextStyle get body => _basePoppins.copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.normal, // Regular
      );

  static TextStyle get small => _basePoppins.copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.normal, // Regular
      );

  static TextStyle get caption => _basePoppins.copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.w500, // Medium
      );
}
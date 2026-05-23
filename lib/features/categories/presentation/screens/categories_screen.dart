import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_radius.dart';
import '../../../../theme/app_spacing.dart';
import '../../../../theme/app_typography.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Liste temporaire des catégories du MVP
    final categories = [
      {'title': 'Légendes', 'icon': '⭐', 'color': AppColors.bleuPSG},
      {'title': 'Histoire', 'icon': '📚', 'color': AppColors.rougePSG},
      {'title': 'Saison Actuelle', 'icon': '🔥', 'color': AppColors.grisFonce},
      {'title': 'Maillots & Stades', 'icon': '👕', 'color': AppColors.grisFonce},
    ];

    return Scaffold(
      backgroundColor: AppColors.noirProfond,
      appBar: AppBar(
        backgroundColor: AppColors.noirProfond,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.blanc),
          onPressed: () => context.pop(), // Permet de revenir à l'Accueil
        ),
        title: Text('CATÉGORIES', style: AppTypography.h3),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.sections),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choisis ton terrain de jeu', 
              style: AppTypography.body.copyWith(color: AppColors.grisClair),
            ),
            AppSpacing.h16,
            
            // Grille des catégories
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.1,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: cat['color'] as Color,
                      borderRadius: AppRadius.m,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: AppRadius.m,
                        onTap: () {
                          // Futur accès à la boucle de jeu
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Lancement de la catégorie ${cat['title']}... ⏳')),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(cat['icon'] as String, style: const TextStyle(fontSize: 40)),
                            AppSpacing.h8,
                            Text(
                              cat['title'] as String,
                              style: AppTypography.body.copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
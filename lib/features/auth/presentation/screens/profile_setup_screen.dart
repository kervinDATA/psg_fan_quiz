import 'package:flutter/material.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_radius.dart';
import '../../../../theme/app_spacing.dart';
import '../../../../theme/app_typography.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/routes/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/providers/player_provider.dart';

class ProfileSetupScreen extends ConsumerStatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  ConsumerState<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends ConsumerState<ProfileSetupScreen> {
  final _pseudoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  // Liste des avatars émojis disponibles pour le MVP 
  final List<String> _avatars = ['⚽', '🏟️', '🏆', '👕', '👑', '🔴', '🔵', '⚡'];
  
  // Par défaut, le tout premier avatar (le ballon ⚽) est sélectionné
  int _selectedAvatarIndex = 0;

  @override
  void dispose() {
    _pseudoController.dispose();
    super.dispose();
  }

  // 🔴 LA FONCTION CORRIGÉE AVEC ASYNC/AWAIT
  Future<void> _onPlayPressed() async {
    if (_formKey.currentState!.validate()) {
      final pseudo = _pseudoController.text.trim();
      final avatar = _avatars[_selectedAvatarIndex];
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Bienvenue au Parc, $pseudo $avatar ! 🔴🔵'),
          backgroundColor: AppColors.vertSucces,
        ),
      );

      // On attend que le profil soit créé dans Firebase
      await ref.read(playerProvider.notifier).createProfile(pseudo, avatar);

      // On navigue vers l'accueil uniquement si tout s'est bien passé
      if (context.mounted) {
        context.go(AppRoutes.home);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.noirProfond,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.sections),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppSpacing.h32,
                  
                  Text(
                    'REJOINS LE CLUB',
                    style: AppTypography.h1.copyWith(letterSpacing: 2.0),
                  ),
                  AppSpacing.h8,
                  Text(
                    'Crée ton profil de supporter pour entrer sur le terrain.',
                    textAlign: TextAlign.center,
                    style: AppTypography.body.copyWith(color: AppColors.grisClair),
                  ),
                  
                  AppSpacing.h32,

                  Text(
                    'CHOISIS TON AVATAR',
                    style: AppTypography.h3.copyWith(color: AppColors.blanc, letterSpacing: 1.0),
                  ),
                  AppSpacing.h16,
                  
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _avatars.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      final isSelected = _selectedAvatarIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedAvatarIndex = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.bleuPSG : AppColors.grisFonce,
                            borderRadius: AppRadius.m,
                            border: Border.all(
                              color: isSelected ? AppColors.rougePSG : Colors.transparent,
                              width: 2,
                            ),
                            boxShadow: isSelected 
                                ? [BoxShadow(color: AppColors.rougePSG.withOpacity(0.4), blurRadius: 8)]
                                : null,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            _avatars[index],
                            style: const TextStyle(fontSize: 32),
                          ),
                        ),
                      );
                    },
                  ),

                  AppSpacing.h32,

                  TextFormField(
                    controller: _pseudoController,
                    style: AppTypography.body.copyWith(color: AppColors.blanc),
                    cursorColor: AppColors.rougePSG,
                    decoration: InputDecoration(
                      labelText: 'Ton Pseudo de Fan',
                      labelStyle: AppTypography.body.copyWith(color: AppColors.grisClair),
                      floatingLabelStyle: AppTypography.body.copyWith(color: AppColors.rougePSG),
                      filled: true,
                      fillColor: AppColors.grisFonce,
                      prefixIcon: const Icon(Icons.person_outline, color: AppColors.grisClair),
                      border: OutlineInputBorder(
                        borderRadius: AppRadius.m,
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: AppRadius.m,
                        borderSide: const BorderSide(color: AppColors.rougePSG, width: 2.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: AppRadius.m,
                        borderSide: const BorderSide(color: AppColors.rougeErreur, width: 1.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: AppRadius.m,
                        borderSide: const BorderSide(color: AppColors.rougeErreur, width: 2.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Le pseudo est obligatoire, titi !';
                      }
                      if (value.trim().length < 3) {
                        return 'Au moins 3 caractères pour entrer sur le terrain.';
                      }
                      if (value.trim().length > 20) {
                        return 'Maximum 20 caractères, calme ton coup de franc.';
                      }
                      return null;
                    },
                  ),

                  AppSpacing.h48,

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _onPlayPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.rougePSG,
                        foregroundColor: AppColors.blanc,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: AppRadius.s,
                        ),
                      ),
                      child: const Text('ENTRER AU PARC'),
                    ),
                  ),
                  
                  AppSpacing.h16,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
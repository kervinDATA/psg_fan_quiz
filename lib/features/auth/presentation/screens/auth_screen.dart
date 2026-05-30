import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/routes/app_router.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_spacing.dart';
import '../../../../theme/app_typography.dart';
import '../../../../theme/app_radius.dart';
import '../../data/repositories/auth_repository.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  bool _isLogin = true; // Permet de basculer entre Connexion et Inscription
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final authRepo = ref.read(authRepositoryProvider);
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      if (_isLogin) {
        await authRepo.signInWithEmail(email, password);
        // Si c'est une connexion, le profil existe déjà, on va à l'accueil
        if (mounted) context.go(AppRoutes.home);
      } else {
        await authRepo.signUpWithEmail(email, password);
        // Si c'est une inscription, on l'envoie configurer son profil (pseudo/avatar)
        if (mounted) context.go(AppRoutes.profileSetup);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erreur d\'authentification. Vérifie tes identifiants.'),
            backgroundColor: AppColors.rougeErreur,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.noirProfond,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.sections),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('PSG FAN QUIZ', style: AppTypography.h1.copyWith(color: AppColors.blanc, letterSpacing: 2.0)),
                  Container(margin: const EdgeInsets.only(top: 8.0, bottom: 48.0), width: 80, height: 4, color: AppColors.rougePSG),
                  
                  Text(_isLogin ? 'CONNEXION' : 'CRÉER UN COMPTE', style: AppTypography.h2),
                  AppSpacing.h32,

                  // Champ Email
                  TextFormField(
                    controller: _emailController,
                    style: const TextStyle(color: AppColors.blanc),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: AppColors.grisClair),
                      filled: true,
                      fillColor: AppColors.grisFonce,
                      border: OutlineInputBorder(borderRadius: AppRadius.m, borderSide: BorderSide.none),
                    ),
                    validator: (value) => value != null && value.contains('@') ? null : 'Email invalide',
                  ),
                  AppSpacing.h16,

                  // Champ Mot de Passe
                  TextFormField(
                    controller: _passwordController,
                    style: const TextStyle(color: AppColors.blanc),
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      labelStyle: const TextStyle(color: AppColors.grisClair),
                      filled: true,
                      fillColor: AppColors.grisFonce,
                      border: OutlineInputBorder(borderRadius: AppRadius.m, borderSide: BorderSide.none),
                    ),
                    validator: (value) => value != null && value.length >= 6 ? null : '6 caractères minimum',
                  ),
                  AppSpacing.h32,

                  // Bouton Valider
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _submitForm,
                      child: _isLoading 
                          ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: AppColors.blanc, strokeWidth: 2))
                          : Text(_isLogin ? 'SE CONNECTER' : 'S\'INSCRIRE'),
                    ),
                  ),
                  AppSpacing.h16,

                  // Bascule Connexion/Inscription
                  TextButton(
                    onPressed: () => setState(() => _isLogin = !_isLogin),
                    child: Text(
                      _isLogin ? 'Pas encore de compte ? S\'inscrire' : 'Déjà un compte ? Se connecter',
                      style: const TextStyle(color: AppColors.grisClair),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
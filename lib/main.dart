import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart'; // 👈 L'import du package
import 'firebase_options.dart'; // 👈 L'import de ta configuration sur-mesure
import 'app/app.dart';

void main() async {
  // Obligatoire quand on veut lancer des processus (comme Firebase) avant runApp
  WidgetsFlutterBinding.ensureInitialized();
  
  // 🔴 NOUVEAU : On allume Firebase avec les clés de ton projet
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // On enveloppe l'application dans le ProviderScope pour activer Riverpod
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
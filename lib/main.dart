import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // 👈 L'import magique
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // On garde Firebase commenté pour le moment (MVP hors ligne)
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // On enveloppe l'application dans le ProviderScope pour activer Riverpod
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
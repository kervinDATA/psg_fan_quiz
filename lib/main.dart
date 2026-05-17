import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/app.dart';
import 'firebase_options.dart';

void main() async {
  // Assure l'initialisation des bindings natifs avant Firebase
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialisation de Firebase avec les options générées par FlutterFire
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Lancement de l'application enveloppée dans le ProviderScope de Riverpod
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
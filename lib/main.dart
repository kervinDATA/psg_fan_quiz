import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/app.dart';

void main() async {
  // Assure l'initialisation des bindings natifs
  WidgetsFlutterBinding.ensureInitialized();
  
  // TOUT Firebase est commenté pour l'instant pour valider l'UI locale
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
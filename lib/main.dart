import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart'; // 👈 Import pour kIsWeb et PlatformDispatcher
import 'firebase_options.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisation de Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 🔴 NOUVEAU : Configuration de Crashlytics (Uniquement pour le mobile)
  if (!kIsWeb) {
    // 1. Intercepte toutes les erreurs synchrones (UI) de Flutter
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    // 2. Intercepte toutes les erreurs asynchrones (réseau, base de données)
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  // Lancement de l'application
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
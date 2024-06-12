import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:emr_m_app/firebase_options.dart';
import 'package:emr_m_app/registration_provider.dart';
import 'package:emr_m_app/services/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Colors to Use #
// 433E49 / 928490 / DBC1AD / F3E8EB

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ChangeNotifierProvider(
    create: (context) => RegistrationProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
          backgroundColor: Colors.black,
          duration: 1500,
          splash: Transform.scale(
            scale: 1.7,
            child: Image.asset(
              'images/EduCare-Rect-Black.png',
            ),
          ),
          nextScreen: const AuthPage()),
    );
  }
}

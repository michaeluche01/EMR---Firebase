import 'package:emr_m_app/Pages/home/home_main.dart';
import 'package:emr_m_app/Pages/onboarding/login_patient_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeMain();
          }
          // if user is NOT logged in
          else {
            return const LoginPatientPage();
          }
        },
      ),
    );
  }
}

// if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           //if User IS logged in
//           else

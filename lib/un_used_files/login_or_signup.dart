// import 'package:emr_m_app/Pages/onboarding/login_page.dart';
// import 'package:emr_m_app/Pages/onboarding/sign_up.dart';
// import 'package:flutter/material.dart';

// class LoginOrRegister extends StatefulWidget {
//   const LoginOrRegister({super.key});

//   @override
//   State<LoginOrRegister> createState() => _LoginOrRegisterState();
// }

// class _LoginOrRegisterState extends State<LoginOrRegister> {
//   // show login page initially

//   bool showLoginPage = true;

//   // toggle between login and register pages
//   void togglePages() {
//     setState(() {
//       showLoginPage = !showLoginPage;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showLoginPage) {
//       return LoginPage(
//         onTap: togglePages,
//       );
//     } else {
//       return SignUpPage(
//         onTap: togglePages,
//       );
//     }
//   }
// }

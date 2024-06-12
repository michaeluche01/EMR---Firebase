// import 'package:emr_m_app/Pages/onboarding/login_page.dart';
// import 'package:flutter/material.dart';

// class OnboardQuestion extends StatelessWidget {
//   const OnboardQuestion({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // const SizedBox(height: 50),
//               Image.asset(
//                 'images/Educare-Black-Rounded.png',
//                 // width: 200,
//                 // height: 200,
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'EduCare',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25,
//                 ),
//               ),

//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return const LoginPage();
//                       },
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF433E49),
//                     foregroundColor: Colors.white,
//                     elevation: 1,
//                     minimumSize: const Size(300, 70)),
//                 child: const Text(
//                   'PATIENT',
//                   style: TextStyle(
//                     // fontWeight: FontWeight.w500,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return const LoginPage();
//                       },
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF433E49),
//                     foregroundColor: Colors.white,
//                     elevation: 1,
//                     minimumSize: const Size(300, 70)),
//                 child: const Text(
//                   'MEDICAL PERSONNEL',
//                   style: TextStyle(
//                     // fontWeight: FontWeight.w500,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

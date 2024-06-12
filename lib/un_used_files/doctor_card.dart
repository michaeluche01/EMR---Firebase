// import 'package:flutter/material.dart';

// class DoctorCard extends StatelessWidget {
//   final String drName;
//   final String drTitle;
//   final String drImage;
//   final String drExperience;
//   final String drRating;

//   const DoctorCard({
//     super.key,
//     required this.drExperience,
//     required this.drImage,
//     required this.drName,
//     required this.drTitle,
//     required this.drRating,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 25.0),
//       child: Container(
//         padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 5),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: Colors.grey,
//         ),
//         child: Column(
//           children: [
//             //picture
//             ClipRRect(
//               borderRadius: BorderRadius.circular(60),
//               child: Image.asset(
//                 drImage,
//                 height: 100,
//               ),
//             ),
//             const SizedBox(height: 10),

//             //rating
//             Row(
//               children: [
//                 Icon(
//                   Icons.star,
//                   color: Colors.yellow[800],
//                 ),
//                 const SizedBox(width: 4),
//                 Text(
//                   drRating,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),

//             // doctor name
//             Text(
//               drName,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//             const SizedBox(height: 5),

//             //doctor title
//             Text(
//               drTitle,
//               style: const TextStyle(
//                 fontStyle: FontStyle.italic,
//               ),
//             ),
//             Text(
//               drExperience,
//               style: const TextStyle(
//                 fontStyle: FontStyle.italic,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:emr_m_app/Pages/home/home_main.dart';
// import 'package:emr_m_app/Pages/home/home_route/profile.dart';
// import 'package:emr_m_app/models/home_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class GridBox extends StatefulWidget {
//   const GridBox({super.key});

//   @override
//   State<GridBox> createState() => _GridBoxState();
// }

// class _GridBoxState extends State<GridBox> {
//   List<HomeModel> home = [];

//   void _getHomeGrid() {
//     home = HomeModel.getHomeGrid();
//   }

//   @override
//   Widget build(BuildContext context) {
//     _getHomeGrid();

//     return Column(
//       children: [
//         SizedBox(
//           height: 270,
//           child: GridView.count(
//             crossAxisCount: 3, // Number of columns in the grid
//             crossAxisSpacing: 10.0, // Spacing between columns
//             mainAxisSpacing: 10.0, // Spacing between rows
//             padding: const EdgeInsets.all(10.0), // Padding around the grid
//             children: List.generate(6, (index) {
//               return GestureDetector(
//                 onTap: () {
//                   // Handle tap event based on index or any other identifier
//                   switch (index) {
//                     case 0:
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const HomeMain()),
//                       );
//                       break;
//                     case 1:
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const ProfilePage()),
//                       );
//                       break;
//                     case 2:
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const ProfilePage()),
//                       );
//                       break;
//                     case 3:
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const ProfilePage()),
//                       );
//                       break;
//                     case 4:
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const ProfilePage()),
//                       );
//                       break;
//                     case 5:
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const ProfilePage()),
//                       );
//                       break;
//                   }
//                 },
//                 child: GridTile(
//                   child: Container(
//                     color: const Color(0xFF928490),
//                     child: Center(
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(top: 10),
//                             child: SvgPicture.asset(
//                               home[index].svgPath,
//                               width: 35, // Adjust SVG size as needed
//                               height: 35, // Adjust SVG size as needed
//                             ),
//                           ),
//                           const SizedBox(height: 5),
//                           Text(
//                             home[index].name,
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             }),
//           ),
//         ),
//       ],
//     );
//     // return SingleChildScrollView(
//     //   child: Container(
//     //     height: 150,
//     //     child: ListView.separated(
//     //         scrollDirection: Axis.horizontal,
//     //         itemCount: home.length,
//     //         separatorBuilder: (context, index) => const SizedBox(
//     //               width: 10,
//     //             ),
//     //         itemBuilder: (context, index) {
//     //           return Container(
//     //             width: 120, // Adjust width as needed
//     //             // height: 120, // Adjust height as needed
//     //             decoration: BoxDecoration(
//     //               color: const Color(0xFF928490), // Adjust color as needed
//     //               borderRadius: BorderRadius.circular(
//     //                   10), // Adjust border radius as needed
//     //             ),
//     //             child: Center(
//     //               child: Column(
//     //                 mainAxisAlignment: MainAxisAlignment.center,
//     //                 children: [
//     //                   SvgPicture.asset(
//     //                     home[index].svgPath,
//     //                     width: 30, // Adjust SVG size as needed
//     //                     height: 30, // Adjust SVG size as needed
//     //                   ),
//     //                   const SizedBox(
//     //                       height: 10), // Spacing between SVG and name
//     //                   Text(
//     //                     home[index].name,
//     //                     style: const TextStyle(
//     //                         color: Colors.white, // Adjust text color as needed
//     //                         fontSize: 14,
//     //                         fontWeight: FontWeight.w500),
//     //                   ),
//     //                 ],
//     //               ),
//     //             ),
//     //           );
//     //         }),
//     //   ),
//     // );
//   }
// }

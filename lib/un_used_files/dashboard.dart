// import 'package:emr_m_app/components/grid_box.dart';
// import 'package:emr_m_app/components/profile_image.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';


// class Dashboard extends StatelessWidget {
//   const Dashboard({super.key});

//   void signUserOut() {
//     FirebaseAuth.instance.signOut();
//   }

//   @override
//   Widget build(BuildContext context) {
//     const drawerHeader = UserAccountsDrawerHeader(
//       accountName: Text('Chiedozie Michael'),
//       accountEmail: Text('ceemichael504@gmail.com'),
//       decoration: BoxDecoration(
//         color: Color(0xFF928490),
//       ),
//       // currentAccountPicture: CircleAvatar(
//       //   backgroundImage: AssetImage('images/male-avatar.png'),
//       // ),
//     );

//     final drawerItems = ListView(
//       children: [
//         drawerHeader,
//         ListTile(
//           title: const Text(
//             'Settings',
//             style: TextStyle(fontWeight: FontWeight.w600),
//           ),
//           leading: const Icon(Icons.settings),
//           onTap: () {
//             // Navigator.of(BuildContext context).push(
//             //   MaterialPageRoute(
//             //     builder: (context) => const ErrorPage(),
//             //   ),
//             // );
//           },
//         ),
//         ListTile(
//           title: const Text(
//             'Help',
//             style: TextStyle(fontWeight: FontWeight.w600),
//           ),
//           leading: const Icon(Icons.help),
//           onTap: () {
//             // Navigator.of(context).push(
//             //   MaterialPageRoute(
//             //     builder: (context) => const GridViewCreate(),
//             //   ),
//             // );
//           },
//         ),
//         ListTile(
//           title: const Text(
//             'Logout',
//             style: TextStyle(fontWeight: FontWeight.w600),
//           ),
//           leading: const Icon(Icons.logout_rounded),
//           onTap: () {
//             signUserOut();
//             // Navigator.of(context).push(
//             //   MaterialPageRoute(
//             //     builder: (context) => const OnboardQuestion(),
//             //   ),
//             // );
//           },
//         ),
//       ],
//     );
//     return Scaffold(
//       backgroundColor: const Color(0xFFF3E8EB),
//       appBar: AppBar(
//         title: const Text(
//           'Home',
//           style: TextStyle(fontWeight: FontWeight.w500),
//         ),
//         centerTitle: true,
//         automaticallyImplyLeading: true,
//         backgroundColor: const Color(0xFFF3E8EB),
//         // actions: const [
//         //   Padding(
//         //     padding: EdgeInsets.all(10.0),
//         //     child: Icon(Icons.logout_outlined),
//         //   ),
//         // ],
//       ),
//       drawer: Drawer(
//         backgroundColor: Colors.white,
//         child: drawerItems,
//       ),
//       body: const Padding(
//         padding: EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 ProfileImage(
//                   imageUrl: 'images/mike.jpg',
//                   name: 'Chiedozie Michael',
//                   age: 'X Years',
//                   gender: 'Male',
//                   id: '20N02022',
//                 )
//               ],
//             ),
//             SizedBox(height: 10),
//             Column(
//               children: [
//                 SizedBox(height: 10),
//                 GridBox(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:emr_m_app/Pages/onboarding/login_patient_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void signUserOut() {
    FirebaseAuth.instance.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPatientPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E8EB),
      appBar: AppBar(
        title: const Text('PROFILE', style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),),
        backgroundColor: const Color(0xFFF3E8EB),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/mike.jpg'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Michael Uche',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Patient',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            const ListTile(
              leading: Icon(Icons.email),
              title: Text('root@gmail.com.com'),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('+234 9012848742'),
            ),
            const ListTile(
              leading: Icon(Icons.school),
              title: Text('Ajayi Crowther University'),
            ),
            GestureDetector(
              onTap: () {
                signUserOut();
              },
              child: const ListTile(
                leading: Icon(Icons.logout_outlined),
                title: Text('Logout'),
              ),
            ),
            // Add more user information as needed
          ],
        ),
      ),
    );
  }
}

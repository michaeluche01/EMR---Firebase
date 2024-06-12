import 'package:emr_m_app/Pages/onboarding/login_admin_page.dart';
import 'package:emr_m_app/Pages/registration_sections/reg_stage1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  void signout() {
    FirebaseAuth.instance.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginAdminPage()),
    );
  }

  void registerPatient() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterStage1()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Admin Panel',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF3E8EB),
        actions: [
          GestureDetector(
            onTap: signout,
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: const Border.fromBorderSide(
                        BorderSide(color: Colors.white)),
                    color: Colors.red[600],
                    shape: BoxShape.circle),
                child: const Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          )
        ],
      ),
      backgroundColor: const Color(0xFFF3E8EB),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        final double maxWidth = constraints.maxWidth;
        final double buttonWidth = maxWidth * 0.8;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: buttonWidth,
                  child: ElevatedButton(
                    onPressed: () {
                      registerPatient();
                    },
                    child: const Text('Register Patient'),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: buttonWidth,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to prescribe drugs page
                    },
                    child: const Text('Prescribe Drugs'),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: buttonWidth,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to view all registered patients page
                    },
                    child: const Text('View All Registered Patients'),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: buttonWidth,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to set ambulance phone number page
                    },
                    child: const Text('Set Ambulance Phone Number'),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

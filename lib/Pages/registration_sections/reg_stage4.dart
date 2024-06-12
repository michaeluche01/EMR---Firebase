import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emr_m_app/Pages/admin_page.dart';
import 'package:emr_m_app/components/my_button.dart';
import 'package:emr_m_app/components/my_textfield.dart';
import 'package:emr_m_app/registration_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterStage4 extends StatefulWidget {
  const RegisterStage4({super.key});

  @override
  State<RegisterStage4> createState() => _RegisterStage4State();
}

class _RegisterStage4State extends State<RegisterStage4> {
  final currentmedcontroller = TextEditingController();
  final allergiescontroller = TextEditingController();
  final emergphonecontroller = TextEditingController();
  final prevsurgeriescontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final registrationProvider = Provider.of<RegistrationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3E8EB),
      ),
      backgroundColor: const Color(0xFFF3E8EB),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "MEDICAL INFORMATION",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 10),
              Text(
                "Click on Next to proceed to the next Registration Phase",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
              const SizedBox(height: 50),
              Text(
                "Current Medications",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 8),
              MyTextField(
                hintText: 'Current Med (Name, dosage, frequency) ',
                controller: currentmedcontroller,
                obscureText: false,
                onChanged: (value) =>
                    registrationProvider.updateCurrentMed(value),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 10),
              MyTextField(
                hintText: 'Allergies',
                controller: allergiescontroller,
                obscureText: false,
                onChanged: (value) =>
                    registrationProvider.updateAllergies(value),
              ),
              const SizedBox(height: 20),
              MyTextField(
                hintText: 'Previous Surgeries',
                controller: prevsurgeriescontroller,
                obscureText: false,
                onChanged: (value) =>
                    registrationProvider.updatePrevSurgeries(value),
              ),
              const SizedBox(height: 20),
              MyButton(
                buttonName: 'Submit',
                onTap: () async {
                  await FirebaseFirestore.instance.collection("userdata").add({
                    'firstname':
                        registrationProvider.registrationData.firstName,
                    'lastname': registrationProvider.registrationData.lastName,
                    'address': registrationProvider.registrationData.address,
                    'Date of Birth':
                        registrationProvider.registrationData.dateOfBirth,
                    'Gender': registrationProvider.registrationData.gender,
                    'Marital Status':
                        registrationProvider.registrationData.maritalStatus,
                    'Nationality':
                        registrationProvider.registrationData.nationality,
                    'Email': registrationProvider.registrationData.email,
                    'Phone Number': registrationProvider.registrationData.phone,
                    'Username': registrationProvider.registrationData.username,
                    'Student ID':
                        registrationProvider.registrationData.studentId,
                    'Password': registrationProvider.registrationData.password,
                    'Emergency Contact Firstname': registrationProvider
                        .registrationData.emergencyfirstname,
                    'Emergency Contact Lastname':
                        registrationProvider.registrationData.emergencylastname,
                    'Emergency Phone Number':
                        registrationProvider.registrationData.emergencyphone,
                    'Emergency Contact Relationship': registrationProvider
                        .registrationData.emergencyRelationship,
                    'Current Medications':
                        registrationProvider.registrationData.currentMed,
                    'Allergies':
                        registrationProvider.registrationData.allergies,
                    'Previous Surgeries':
                        registrationProvider.registrationData.prevSurgeries,
                  });
                  // clear the data
                  registrationProvider.clearData();

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Success'),
                        content: const Text(
                            'Your data has been saved successfully!'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                          ),
                        ],
                      );
                    },
                  );

                  // Navigate to a confirmation or home page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AdminPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

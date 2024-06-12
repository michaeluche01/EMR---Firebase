import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emr_m_app/models/registrationdata.dart';
import 'package:flutter/material.dart';

class PrescriptionPage extends StatefulWidget {
  const PrescriptionPage({super.key});

  @override
  State<PrescriptionPage> createState() => _PrescriptionPageState();
}

Future<List<RegistrationData>> fetchRegistrationData() async {
  final querySnapshot = await FirebaseFirestore.instance.collection('registration_data').get();
  return querySnapshot.docs.map((doc) => RegistrationData.fromDocument(doc)).toList();
}

class _PrescriptionPageState extends State<PrescriptionPage> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Records'),
      ),
      body: FutureBuilder<List<RegistrationData>>(
        future: fetchRegistrationData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No records found'));
          } else {
            final records = snapshot.data!;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('First Name')),
                  DataColumn(label: Text('Last Name')),
                  DataColumn(label: Text('Address')),
                  DataColumn(label: Text('Date of Birth')),
                  DataColumn(label: Text('Gender')),
                  DataColumn(label: Text('Marital Status')),
                  DataColumn(label: Text('Nationality')),
                  DataColumn(label: Text('Email')),
                  DataColumn(label: Text('Phone')),
                  DataColumn(label: Text('Username')),
                  DataColumn(label: Text('Student ID')),
                  DataColumn(label: Text('Emergency First Name')),
                  DataColumn(label: Text('Emergency Last Name')),
                  DataColumn(label: Text('Emergency Phone')),
                  DataColumn(label: Text('Emergency Relationship')),
                  DataColumn(label: Text('Current Med')),
                  DataColumn(label: Text('Allergies')),
                  DataColumn(label: Text('Prev Surgeries')),
                ],
                rows: records
                    .map(
                      (record) => DataRow(cells: [
                        DataCell(Text(record.firstName ?? '')),
                        DataCell(Text(record.lastName ?? '')),
                        DataCell(Text(record.address ?? '')),
                        DataCell(Text(record.dateOfBirth ?? '')),
                        DataCell(Text(record.gender ?? '')),
                        DataCell(Text(record.maritalStatus ?? '')),
                        DataCell(Text(record.nationality ?? '')),
                        DataCell(Text(record.email ?? '')),
                        DataCell(Text(record.phone ?? '')),
                        DataCell(Text(record.username ?? '')),
                        DataCell(Text(record.studentId ?? '')),
                        DataCell(Text(record.emergencyfirstname ?? '')),
                        DataCell(Text(record.emergencylastname ?? '')),
                        DataCell(Text(record.emergencyphone ?? '')),
                        DataCell(Text(record.emergencyRelationship ?? '')),
                        DataCell(Text(record.currentMed ?? '')),
                        DataCell(Text(record.allergies ?? '')),
                        DataCell(Text(record.prevSurgeries ?? '')),
                      ]),
                    )
                    .toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
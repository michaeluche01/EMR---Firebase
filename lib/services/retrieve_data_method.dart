import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emr_m_app/models/registrationdata.dart';

Future<List<RegistrationData>> fetchRegistrationData() async {
  final querySnapshot = await FirebaseFirestore.instance.collection('registration_data').get();
  return querySnapshot.docs.map((doc) => RegistrationData.fromDocument(doc)).toList();
}

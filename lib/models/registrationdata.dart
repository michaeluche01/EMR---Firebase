import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationData {
  String? firstName;
  String? lastName;
  String? address;
  String? dateOfBirth;
  String? gender;
  String? maritalStatus;
  String? nationality;
  String? email;
  String? phone;
  String? username;
  String? studentId;
  String? password;
  String? emergencyfirstname;
  String? emergencylastname;
  String? emergencyphone;
  String? emergencyRelationship;
  String? currentMed;
  String? allergies;
  String? prevSurgeries;

  RegistrationData({
    this.firstName,
    this.lastName,
    this.address,
    this.dateOfBirth,
    this.gender,
    this.maritalStatus,
    this.nationality,
    this.email,
    this.phone,
    this.username,
    this.studentId,
    this.password,
    this.allergies,
    this.currentMed,
    this.emergencyRelationship,
    this.emergencyfirstname,
    this.emergencylastname,
    this.emergencyphone,
    this.prevSurgeries,
  });

  factory RegistrationData.fromDocument(DocumentSnapshot doc) {
    return RegistrationData(
      firstName: doc['firstName'],
      lastName: doc['lastName'],
      address: doc['address'],
      dateOfBirth: doc['dateOfBirth'],
      gender: doc['gender'],
      maritalStatus: doc['maritalStatus'],
      nationality: doc['nationality'],
      email: doc['email'],
      phone: doc['phone'],
      username: doc['username'],
      studentId: doc['studentId'],
      password: doc['password'],
      allergies: doc['allergies'],
      currentMed: doc['currentMed'],
      emergencyRelationship: doc['emergencyRelationship'],
      emergencyfirstname: doc['emergencyfirstname'],
      emergencylastname: doc['emergencylastname'],
      emergencyphone: doc['emergencyphone'],
      prevSurgeries: doc['prevSurgeries'],
    );
  }
}

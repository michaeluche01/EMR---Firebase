import 'package:emr_m_app/models/registrationdata.dart';
import 'package:flutter/material.dart';

class RegistrationProvider with ChangeNotifier {
  RegistrationData _registrationData = RegistrationData();

  RegistrationData get registrationData => _registrationData;

  void updateFirstName(String firstname) {
    _registrationData.firstName = firstname;
    notifyListeners();
  }

  void updateLastName(String lastName) {
    _registrationData.lastName = lastName;
    notifyListeners();
  }

  void updateAddress(String address) {
    _registrationData.address = address;
    notifyListeners();
  }

  void updateDateOfBirth(String dateOfBirth) {
    _registrationData.dateOfBirth = dateOfBirth;
    notifyListeners();
  }

  void updateGender(String gender) {
    _registrationData.gender = gender;
    notifyListeners();
  }

  void updateMaritalStatus(String maritalStatus) {
    _registrationData.maritalStatus = maritalStatus;
    notifyListeners();
  }

  void updateNationality(String nationality) {
    _registrationData.nationality = nationality;
    notifyListeners();
  }

  void updateEmail(String email) {
    _registrationData.email = email;
    notifyListeners();
  }

  void updatePhone(String phone) {
    _registrationData.phone = phone;
    notifyListeners();
  }

  void updateUsername(String username) {
    _registrationData.username = username;
    notifyListeners();
  }

  void updateStudentId(String studentId) {
    _registrationData.studentId = studentId;
    notifyListeners();
  }

  void updatePassword(String password) {
    _registrationData.password = password;
    notifyListeners();
  }

  void updateEmergencyfirstname(String emergencyfirstname) {
    _registrationData.emergencyfirstname = emergencyfirstname;
    notifyListeners();
  }

  void updateEmergencylastname(String emergencylastname) {
    _registrationData.emergencylastname = emergencylastname;
    notifyListeners();
  }

  void updateEmergencyphone(String emergencyphone) {
    _registrationData.emergencyphone = emergencyphone;
    notifyListeners();
  }

  void updateEmergencyRelationship(String emergencyRelationship) {
    _registrationData.emergencyRelationship = emergencyRelationship;
    notifyListeners();
  }

  void updateCurrentMed(String currentMed) {
    _registrationData.currentMed = currentMed;
    notifyListeners();
  }

  void updateAllergies(String allergies) {
    _registrationData.allergies = allergies;
    notifyListeners();
  }

  void updatePrevSurgeries(String prevSurgeries) {
    _registrationData.prevSurgeries = prevSurgeries;
    notifyListeners();
  }

  void clearData() {
    _registrationData = RegistrationData();
    notifyListeners();
  }
}

import 'package:emr_m_app/Pages/registration_sections/reg_stage4.dart';
import 'package:emr_m_app/components/emergency_contact.dart';
import 'package:emr_m_app/components/my_button.dart';
import 'package:emr_m_app/components/my_textfield.dart';
import 'package:emr_m_app/registration_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class RegisterStage3 extends StatefulWidget {
  final TextEditingController? controller;

  const RegisterStage3({super.key, this.controller});

  @override
  State<RegisterStage3> createState() => _RegisterStage3State();
}

class _RegisterStage3State extends State<RegisterStage3> {
  final emergencycontactfirstname = TextEditingController();
  final emergencycontactlastname = TextEditingController();
  final emergphonecontroller = TextEditingController();

  late TextEditingController _phonecontroller;

  @override
  void initState() {
    super.initState();
    _phonecontroller = widget.controller ?? TextEditingController();
  }

  void _nextPhase() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterStage4()),
    );
  }

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
                "EMERGENCY CONTACT",
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
              MyTextField(
                hintText: 'Emergency Contact First Name',
                controller: emergencycontactfirstname,
                obscureText: false,
                onChanged: (value) =>
                    registrationProvider.updateEmergencyfirstname(value),
              ),
              const SizedBox(height: 20),
              MyTextField(
                hintText: 'Emergency Contact Last Name',
                controller: emergencycontactlastname,
                obscureText: false,
                onChanged: (value) =>
                    registrationProvider.updateEmergencylastname(value),
              ),
              const SizedBox(height: 20),
              phone(registrationProvider),
              const SizedBox(height: 20),
              const EmergencyContactDropdown(
                contacts: [
                  'Mother',
                  'Father',
                  'brother',
                  'sister',
                  'uncle',
                  'Aunty'
                ],
              ),
              MyButton(
                buttonName: 'Next',
                onTap: _nextPhase,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //phone
  Padding phone(RegistrationProvider registrationProvider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: _phonecontroller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(
              11), // Limit to 11 digits (including the omitted digit)
        ],
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade300,
          filled: true,
          labelText: 'Enter Phone number',
          labelStyle: TextStyle(color: Colors.grey[500]),
          hintStyle: TextStyle(color: Colors.grey[500]),
          prefixText: '+234 ',
          prefixIcon: const Icon(Icons.phone),
        ),
        onChanged: (text) {
          if (text.isNotEmpty && text[0] == '0') {
            _phonecontroller.value = _phonecontroller.value.copyWith(
              text: text.substring(1),
              selection: TextSelection.fromPosition(
                TextPosition(offset: text.length - 1),
              ),
            );
          }
          registrationProvider.updateEmergencyphone(_phonecontroller.text);
        },
      ),
    );
  }
}

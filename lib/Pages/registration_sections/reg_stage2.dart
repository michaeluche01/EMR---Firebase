import 'package:emr_m_app/Pages/registration_sections/reg_stage3.dart';
import 'package:emr_m_app/components/my_button.dart';
import 'package:emr_m_app/components/my_textfield.dart';
import 'package:emr_m_app/registration_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class RegisterStage2 extends StatefulWidget {
  final TextEditingController? controller;
  const RegisterStage2({super.key,  this.controller});

  @override
  State<RegisterStage2> createState() => _RegisterStage2State();
}

final emailcontroller = TextEditingController();
final usernamecontroller = TextEditingController();
final matcontroller = TextEditingController();
final passwordcontroller = TextEditingController();
final phonecontroller = TextEditingController();

class _RegisterStage2State extends State<RegisterStage2> {

  late TextEditingController _phonecontroller;

  @override
  void initState() {
    super.initState();
    _phonecontroller = widget.controller ?? TextEditingController();
  }


  void _nextPhase() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterStage3()),
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
                "USER CREDENTIALS",
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
                hintText: 'Email Address',
                controller: emailcontroller,
                obscureText: false,
                onChanged: (value) => registrationProvider.updateEmail(value),
              ),
              const SizedBox(height: 20),
              phone(registrationProvider),
              const SizedBox(height: 20),
              MyTextField(
                hintText: 'User Name',
                controller: usernamecontroller,
                obscureText: false,
                onChanged: (value) => registrationProvider.updateUsername(value),
              ),
              const SizedBox(height: 20),
              MyTextField(
                hintText: 'Student ID (Matric Number)',
                controller: matcontroller,
                obscureText: false,
                onChanged: (value) => registrationProvider.updateStudentId(value),
              ),
              const SizedBox(height: 20),
              MyTextField(
                hintText: 'Password',
                controller: passwordcontroller,
                obscureText: false,
                onChanged: (value) => registrationProvider.updatePassword(value),
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
        registrationProvider.updatePhone(_phonecontroller.text);
      },
    ),
  );
  }
}

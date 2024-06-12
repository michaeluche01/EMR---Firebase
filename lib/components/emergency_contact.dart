import 'package:emr_m_app/registration_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmergencyContactDropdown extends StatefulWidget {
  final List<String> contacts;

  const EmergencyContactDropdown({
    super.key,
    required this.contacts,
  });

  @override
  State<EmergencyContactDropdown> createState() =>
      _EmergencyContactDropdownState();
}

class _EmergencyContactDropdownState extends State<EmergencyContactDropdown> {
  String? _selectedContact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: DropdownButton<String>(
        dropdownColor: const Color(0xFFF3E8EB),
        value: _selectedContact,
        onChanged: (String? newValue) {
          setState(() {
            _selectedContact = newValue;
          });
           context.read<RegistrationProvider>().updateEmergencyRelationship(newValue!);
        },
        items: widget.contacts.map<DropdownMenuItem<String>>((String contact) {
          return DropdownMenuItem<String>(
            value: contact,
            child: Text(contact),
          );
        }).toList(),
        hint: const Text('Select Emergency Relationship'),
        isExpanded: true,
      ),
    );
  }
}

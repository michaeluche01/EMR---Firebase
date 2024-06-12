import 'package:flutter/material.dart';

class MaritalStatus extends StatefulWidget {
  const MaritalStatus({super.key});

  @override
  State<MaritalStatus> createState() => _MaritalStatusState();
}

class _MaritalStatusState extends State<MaritalStatus> {
  String? _selectedStatus;

  final List<String> _maritalStatuses = [
    'Single',
    'Married',
    'Divorced',
    'Rather not say',
  ];

  @override
  Widget build(BuildContext context) {
    return maritalStatusDropdown();
  }

  Column maritalStatusDropdown() {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Select your Marital Status:',
        style: TextStyle(fontSize: 15.0),
      ),
      const SizedBox(height: 15),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: DropdownButton<String>(
          dropdownColor: const Color(0xFFF3E8EB),
          value: _selectedStatus,
          hint: const Text('Select Status'),
          onChanged: (String? newValue) {
            setState(() {
              _selectedStatus = newValue;
            });
          },
          items:
              _maritalStatuses.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
      SizedBox(height: 20),
      // if (_selectedStatus != null)
      //   Text("Selected Marital Status: $_selectedStatus"),
    ],
  );
  }
}

import 'package:flutter/material.dart';

enum Gender { male, female }

class GenderSelect extends StatefulWidget {
  const GenderSelect({super.key});

  @override
  State<GenderSelect> createState() => _GenderSelectState();
}

class _GenderSelectState extends State<GenderSelect> {
  Gender? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return genderSelection();
  }

  Padding genderSelection() {
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Center(
          child: Text(
            'Select your Gender:',
            style: TextStyle(fontSize: 15.0),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: const Text(
                  'Male',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                leading: Radio<Gender>(
                  value: Gender.male,
                  groupValue: _selectedGender,
                  onChanged: (Gender? value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: const Text(
                  'Female',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                leading: Radio<Gender>(
                  value: Gender.female,
                  groupValue: _selectedGender,
                  onChanged: (Gender? value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        // if (_selectedGender != null)
        //   Text(
        //       "Selected Gender: ${_selectedGender == Gender.male ? "Male" : "Female"}"),
      ],
    ),
  );
  }
}

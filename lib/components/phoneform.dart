import 'package:emr_m_app/registration_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PhoneForm extends StatefulWidget {
  final TextEditingController? controller;

  const PhoneForm({super.key, required this.controller});

  @override
  State<PhoneForm> createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final registrationProvider = Provider.of<RegistrationProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: _controller,
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
            _controller.value = _controller.value.copyWith(
              text: text.substring(1),
              selection: TextSelection.fromPosition(
                TextPosition(offset: text.length - 1),
              ),
            );
          }
          registrationProvider.updatePhone(_controller.text);
        },
      ),
    );
  }
}


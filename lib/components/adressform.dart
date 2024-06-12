import 'package:flutter/material.dart';

class AddressForm extends StatelessWidget {
  final TextEditingController addresscontroller;
  final Function(String)? onChanged;
  const AddressForm({super.key, required this.addresscontroller,  this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: addresscontroller,
        onChanged: onChanged,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade300,
          filled: true,
          hintText: 'Enter your address',
          hintStyle: TextStyle(color: Colors.grey[500]),
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.home),
        ),
      ),
    );
  }
}

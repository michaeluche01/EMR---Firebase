// import 'package:flutter/material.dart';

// class DateOfBirth extends StatefulWidget {
//   const DateOfBirth({super.key});

//   @override
//   State<DateOfBirth> createState() => _DateOfBirthState();
// }

// class _DateOfBirthState extends State<DateOfBirth> {
//   DateTime? _selectedDate;
//   final TextEditingController _dateController = TextEditingController();

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900, 1),
//       lastDate: DateTime.now(),
//     );
//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//         _dateController.text = "${picked.toLocal()}".split(' ')[0];
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return dateofBirth(context);
//   }

//   Padding dateofBirth(BuildContext context) {
//     return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 25.0),
//     child: Column(
//       children: <Widget>[
//         TextField(
//           style: const TextStyle(fontSize: 15),
//           controller: _dateController,
//           decoration: InputDecoration(
//             enabledBorder: const OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.white),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.grey.shade400),
//             ),
//             fillColor: Colors.grey.shade300,
//             filled: true,
//             icon: const Icon(
//               Icons.calendar_today,
//               color: Colors.black,
//             ),
//             hintText: "Date of Birth",
//             hintStyle: TextStyle(
//               fontSize: 15,
//               color: Colors.grey[500],
//             ),
//           ),
//           readOnly: true,
//           onTap: () {
//             _selectDate(context);
//           },
//         ),
//         // const SizedBox(height: 10),
//         // if (_selectedDate != null)
//         //   Text("Selected Date: ${_selectedDate!.toLocal()}".split(' ')[0]),
//       ],
//     ),
//   );
//   }
// }

import 'package:flutter/material.dart';

class AdminButton extends StatelessWidget {
  final Function()? onTap;
  final String textName;
  const AdminButton({super.key, required this.onTap, required this.textName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // height: 100,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(255, 196, 181, 185),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textName,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Icon(
                Icons.add,
                size: 50,
                applyTextScaling: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

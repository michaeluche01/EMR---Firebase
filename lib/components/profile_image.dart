import 'package:flutter/material.dart';


class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});


  @override
  Widget build(BuildContext context) {
    String name = 'Admin';
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 100, // Adjust size as needed
              height: 100, // Adjust size as needed
              decoration: const BoxDecoration(
                color: Colors.black12,
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/mike.jpg'),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Hello $name !',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),        
      ],
    );
  }
}

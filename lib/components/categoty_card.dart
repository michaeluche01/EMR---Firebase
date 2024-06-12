import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategotyCard extends StatelessWidget {
  final String categoryName;
  final String svgPath;
  final VoidCallback onTap;
  const CategotyCard({
    super.key,
    required this.categoryName,
    required this.svgPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xFFDBC1AD),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                svgPath,
                height: 35,
              ),
              const SizedBox(width: 10),
              Text(categoryName),
            ],
          ),
        ),
      ),
    );
  }
}

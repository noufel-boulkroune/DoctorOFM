import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHomeSpeciality extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final double iconSize;

  const CustomHomeSpeciality({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
    this.iconSize = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16),
              child: Icon(icon, color: Colors.white, size: iconSize),
            ),
            Positioned(
              top: -30.h,
              left: -30.h,
              child: Container(
                width: 50.h,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}

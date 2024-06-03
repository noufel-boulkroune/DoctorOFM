import 'package:flutter/material.dart';

class CustomSpeciality extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final double iconSize;
  final double containerSize;

  const CustomSpeciality({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
    this.iconSize = 24.0,
    this.containerSize = 150.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: containerSize,
          height: containerSize,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white, size: iconSize),
                SizedBox(height: 8.0),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  '265 Doctors',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

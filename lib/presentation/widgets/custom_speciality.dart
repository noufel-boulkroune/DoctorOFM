import 'package:dr_office_management/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSpeciality extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color color;
  final double iconSize;

  const CustomSpeciality({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.color,
    required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: screenWidth(context) * 0.4,
          height: screenWidth(context) * 0.4,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  height: iconSize,
                  width: iconSize,
                  fit: BoxFit.cover,
                ),
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

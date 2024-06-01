import 'package:flutter/material.dart';

class Customspeciality extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const Customspeciality({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

enum UserType {
  doctor,
  patient,
}

enum Gender {
  Male,
  Femaile,
}

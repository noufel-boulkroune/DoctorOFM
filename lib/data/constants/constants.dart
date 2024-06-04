import 'package:dr_office_management/data/constants/assets_path.dart';
import 'package:dr_office_management/data/models/grid_items_model.dart';
import 'package:dr_office_management/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

List<UserModel> doctorsList = [
  UserModel(
    type: 'Doctor',
    name: 'Dr. John Doe',
    email: 'john.doe@example.com',
    password: 'password',
    dateOfBirth: DateTime(1980, 10, 15),
    address: '123 Main St, City',
    gender: 'Male',
    areaOfExpertise: 'Cardiology',
    id: '1',
    review: 'Excellent doctor',
  ),
  UserModel(
    type: 'Doctor',
    name: 'Dr. Jane Smith',
    email: 'jane.smith@example.com',
    password: 'password',
    dateOfBirth: DateTime(1975, 8, 20),
    address: '456 Elm St, Town',
    gender: 'Female',
    areaOfExpertise: 'Dermatology',
    id: '2',
    review: 'Highly recommended',
  ),
  UserModel(
    type: 'Doctor',
    name: 'Dr. Michael Johnson',
    email: 'michael.johnson@example.com',
    password: 'password',
    dateOfBirth: DateTime(1985, 5, 10),
    address: '789 Oak St, Village',
    gender: 'Male',
    areaOfExpertise: 'Pediatrics',
    id: '3',
    review: 'Highly skilled surgeon',
  ),
  UserModel(
    type: 'Doctor',
    name: 'Dr. Sarah Lee',
    email: 'sarah.lee@example.com',
    password: 'password',
    dateOfBirth: DateTime(1990, 3, 25),
    address: '101 Pine St, Hamlet',
    gender: 'Female',
    areaOfExpertise: 'Obstetrics and Gynecology',
    id: '4',
    review: 'Very caring',
  ),
  UserModel(
    type: 'Doctor',
    name: 'Dr. Robert Williams',
    email: 'robert.williams@example.com',
    password: 'password',
    dateOfBirth: DateTime(1970, 12, 5),
    address: '202 Maple St, Borough',
    gender: 'Male',
    areaOfExpertise: 'Orthopedics',
    id: '5',
    review: 'Highly skilled surgeon',
  ),
];

List<GridItem> items = [
  GridItem(
      imagePath: 'assets/images/consultation.png',
      text: 'Consultation',
      color: Colors.blue),
  GridItem(
      imagePath: 'assets/images/dental.png',
      text: 'Dental',
      color: Colors.purple),
  GridItem(
      imagePath: 'assets/images/heart.png',
      text: 'Heart',
      color: Colors.orange),
  GridItem(
      imagePath: 'assets/images/house.png',
      text: 'Hospitals',
      color: Colors.green),
  GridItem(
      imagePath: 'assets/images/medicines.png',
      text: 'Medicines',
      color: Colors.red),
  GridItem(
      imagePath: 'assets/images/physician.png',
      text: 'Physician',
      color: Colors.yellow),
  GridItem(
      imagePath: 'assets/images/skin.png', text: 'Skin', color: Colors.teal),
  GridItem(
      imagePath: 'assets/images/surgeon.png',
      text: 'Surgeon',
      color: Colors.deepOrange),
];

List<Map<String, String>> notifications = [
  {
    'date': 'Today, ${DateFormat('MMMM dd, yyyy').format(DateTime.now())}',
    'title': 'Appointment Alarm',
    'description':
        'Your appointment will start in 15 minutes. Stay with the app and take care.',
    'image': AppAssetsPath.alarm,
  },
  {
    'date': 'Today, ${DateFormat('MMMM dd, yyyy').format(DateTime.now())}',
    'title': 'Appointment Confirmed',
    'description':
        'Your appointment will start in 15 minutes. Stay with the app and take care.',
    'image': AppAssetsPath.confirmation,
  },
  {
    'date':
        'Yesterday, ${DateFormat('MMMM dd, yyyy').format(DateTime.now().subtract(Duration(days: 1)))}',
    'title': 'Appointment Alarm',
    'description':
        'Your appointment will start in 15 minutes. Stay with the app and take care.',
    'image': AppAssetsPath.alarmOrange,
  },
];

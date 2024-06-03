import 'package:dr_office_management/data/models/grid_items_model.dart';
import 'package:dr_office_management/data/models/user_model.dart';
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

List<GridItem> items = [
  GridItem(
      icon: Icons.local_hospital, text: 'Consultation', color: Colors.blue),
  GridItem(icon: Icons.local_hospital, text: 'Dental', color: Colors.purple),
  GridItem(icon: Icons.local_hospital, text: 'Heart', color: Colors.orange),
  GridItem(icon: Icons.local_hospital, text: 'Hospitals', color: Colors.green),
  GridItem(icon: Icons.local_hospital, text: 'Medicines', color: Colors.red),
  GridItem(icon: Icons.local_hospital, text: 'Physician', color: Colors.yellow),
  GridItem(icon: Icons.local_hospital, text: 'Skin', color: Colors.teal),
  GridItem(
      icon: Icons.local_hospital, text: 'Surgeon', color: Colors.deepOrange),
];

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

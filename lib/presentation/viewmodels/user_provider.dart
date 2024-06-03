import 'dart:convert';
import 'package:dr_office_management/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  List<UserModel> _doctors = [];

  List<UserModel> get doctors => _doctors;

  Future<List<UserModel>> fetchDoctors() async {
    _doctors = [
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
    try {
      final response = await http.get(
        Uri.parse(
            'https://6658efe7de346625136aee0c.mockapi.io/api/managementSystem/users?type=Doctor'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> userData = jsonDecode(response.body);
        _doctors.addAll(userData.map((json) => UserModel.fromJson(json)));

        notifyListeners();
        return _doctors;
      } else {
        return _doctors;
      }
    } catch (error) {
      return _doctors;
    }
  }

  Future<void> createUser(UserModel user) async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://6658efe7de346625136aee0c.mockapi.io/api/managementSystem/users'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 201) {
        _user = UserModel.fromJson(jsonDecode(response.body));
        notifyListeners();
      } else {
        throw Exception('Failed to create user. Please try again.');
      }
    } catch (error) {
      throw Exception('Error creating user: $error');
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://6658efe7de346625136aee0c.mockapi.io/api/managementSystem/users?email=$email&password=$password'),
      );
      if (response.statusCode == 200) {
        final userData = jsonDecode(response.body);
        if (userData.isNotEmpty) {
          _user = UserModel.fromJson(userData[0]);
          notifyListeners();
        } else {
          throw Exception('Invalid email or password. Please try again.');
        }
      } else {
        throw Exception('Error logging in. Please try again.');
      }
    } catch (error) {
      throw Exception('Error logging in: $error');
    }
  }

  void logoutUser() {
    _user = null;
    notifyListeners();
  }
}

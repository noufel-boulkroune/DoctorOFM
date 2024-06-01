import 'dart:convert';
import 'package:dr_office_management/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

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

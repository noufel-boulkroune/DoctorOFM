import 'dart:io';

import 'package:dr_office_management/data/constants/assets_path.dart';
import 'package:dr_office_management/data/constants/constants.dart';
import 'package:dr_office_management/presentation/viewmodels/user_provider.dart';
import 'package:dr_office_management/presentation/views/authentication/sign_in_screen.dart';
import 'package:dr_office_management/presentation/widgets/loading_widget.dart';
import 'package:dr_office_management/utils/mixins/app_mixin.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dr_office_management/data/constants/app_colors.dart';
import 'package:dr_office_management/presentation/widgets/theme_button.dart';
import 'package:dr_office_management/presentation/widgets/theme_text_form_feild.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dr_office_management/data/models/user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/sign_up';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userProvider = UserProvider();
  final ImagePicker _imagePicker = ImagePicker();

  String _email = '';
  String _fullName = '';
  String _address = '';
  UserType _userType = UserType.patient;
  Gender _selectedGender = Gender.Male;
  DateTime? _dateOfBirth;
  File? _image;

  bool _isLoading = false;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });

      final newUser = UserModel(
        areaOfExpertise: '',
        id: getRandomId(),
        password: "1234",
        name: _fullName,
        email: _email,
        gender: _selectedGender.name,
        dateOfBirth: _dateOfBirth!,
        type: _userType.name,
        address: _address,
      );

      _userProvider.createUser(newUser).then((_) {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushNamed(context, SignInScreen.routeName);
      }).catchError((error) {
        setState(() {
          _isLoading = false;
        });

        _showErrorDialog('Error creating user: $error');
      });
    }
  }

  String _formattedDateOfBirth() {
    if (_dateOfBirth != null) {
      return DateFormat('dd-MM-yyyy').format(_dateOfBirth!);
    } else {
      return 'Select Date of Birth';
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  void _onCameraClick() {
    final action = CupertinoActionSheet(
      message: Text(
        'Profile Picture',
        style: const TextStyle(fontSize: 15.0),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          isDefaultAction: false,
          onPressed: () async {
            Navigator.pop(context);
            XFile? image =
                await _imagePicker.pickImage(source: ImageSource.gallery);
            if (image != null) {
              setState(() {
                _image = File(image.path);
              });
            }
          },
          child: Text('Choose from Gallery'),
        ),
        CupertinoActionSheetAction(
          isDestructiveAction: false,
          onPressed: () async {
            Navigator.pop(context);
            XFile? image =
                await _imagePicker.pickImage(source: ImageSource.camera);
            if (image != null) {
              setState(() {
                _image = File(image.path);
              });
            }
          },
          child: Text('Take Picture'),
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text('Cancel'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
    showCupertinoModalPopup(context: context, builder: (context) => action);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.themeWhiteColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Profile Details',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: InkWell(
                        onTap: () {
                          _onCameraClick();
                        },
                        child: _image == null
                            ? CircleAvatar(
                                radius: 50,
                                child: ClipOval(
                                  child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Image.asset(
                                      _selectedGender == Gender.Male
                                          ? AppAssetsPath.maleProfilePicture
                                          : AppAssetsPath.femaleProfilePicture,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            : CircleAvatar(
                                radius: 50,
                                child: ClipOval(
                                  child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Image.file(
                                      _image!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: const Text('Full Name')),
                    SizedBox(height: 10.h),
                    ThemeTextField(
                      labelText: 'Full Name',
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _fullName = value!;
                      },
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: const Text('Email')),
                    SizedBox(height: 10.h),
                    ThemeTextField(
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      validation: validateEmail,
                      onSaved: (value) {
                        _email = value!;
                      },
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: const Text('Date of Birth')),
                    SizedBox(height: 10.h),
                    ThemeTextField(
                      labelText: 'Date of Birth',
                      hintText: _formattedDateOfBirth(),
                      icon: Icons.calendar_today,
                      isObscure: false,
                      enable: true,
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate:
                              DateTime.now().subtract(Duration(days: 20 * 365)),
                          firstDate: DateTime.now()
                              .subtract(Duration(days: 120 * 365)),
                          lastDate: DateTime.now(),
                        ).then((pickedDate) {
                          if (pickedDate != null) {
                            setState(() {
                              _dateOfBirth = pickedDate;
                            });
                          }
                        });
                      },
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: const Text('Address')),
                    SizedBox(height: 10.h),
                    ThemeTextField(
                      labelText: 'Address',
                      hintText: 'Enter Address',
                      icon: Icons.location_on,
                      isObscure: false,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _address = value!;
                      },
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: const Text('Gender')),
                    SizedBox(height: 10.h),
                    DropdownButtonFormField(
                      value: _selectedGender != null ? _selectedGender : null,
                      decoration: inputDecoration.copyWith(
                        hintText: 'Select Gender',
                        labelText: 'Gender',
                      ),
                      items: Gender.values
                          .map((gender) => DropdownMenuItem(
                                child: Text(gender.name),
                                value: gender,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value!;
                        });
                      },
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: const Text('User Type')),
                    SizedBox(height: 10.h),
                    DropdownButtonFormField<UserType>(
                      value: _userType,
                      decoration: inputDecoration.copyWith(
                        hintText: 'Select Type',
                        labelText: 'Type',
                      ),
                      items: UserType.values
                          .map((type) => DropdownMenuItem(
                                child: Text(type.name),
                                value: type,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _userType = value!;
                        });
                      },
                    ),
                    SizedBox(height: 20.h),
                    ThemeButton(
                      onPressed: _submit,
                      label: "Next",
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_isLoading)
            Center(
              child: LoadingIndicator(),
            ),
        ],
      ),
    );
  }
}

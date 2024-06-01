import 'package:dr_office_management/data/constants/app_colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

String getRandomId() {
  var uuid = const Uuid();
  return uuid.v1();
}

TextStyle textStyleTitle() {
  return TextStyle(fontSize: 19.w, fontWeight: FontWeight.w500);
}

InputDecoration inputDecoration = InputDecoration(
  filled: true,
  fillColor: AppColors.themeWhiteColor,
  contentPadding: EdgeInsets.all(19.w),
  labelStyle: TextStyle(
    color: AppColors.themeLightGrey,
  ),
  errorMaxLines: 2,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: const BorderSide(
      color: AppColors.themeLightGrey,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: const BorderSide(
      color: AppColors.themeLightGrey,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: const BorderSide(
      color: AppColors.themeLightGrey,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: const BorderSide(
      color: AppColors.errorColor,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: const BorderSide(
      color: AppColors.errorColor,
    ),
  ),
);

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }

  if (!EmailValidator.validate(value)) {
    return 'Please enter a valid email address';
  }

  return null;
}

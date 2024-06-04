import 'package:dr_office_management/data/constants/constants.dart';
import 'package:dr_office_management/presentation/views/onboarding/splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:dr_office_management/data/constants/app_colors.dart';
import 'package:dr_office_management/data/constants/assets_path.dart';
import 'package:dr_office_management/presentation/widgets/onboarding_dot.dart';
import 'package:dr_office_management/presentation/widgets/theme_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = '/onboarding1';

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPageIndex = 0;

  List<String> _titles = [
    'Thousands of doctors',
    'Online Consultation',
    'Easy Management'
  ];

  List<String> _descriptions = [
    'You can easily contact with thousands of doctors and contact for your needs.',
    'You can have online consultation with your preferred doctor from anywhere anytime.',
    'Manage your appointments, prescriptions, and medical history easily with our app.'
  ];

  List<Color> _backgroundColors = [
    AppColors.onboarding1Color,
    AppColors.onboarding2Color,
    AppColors.onboarding3Color,
  ];

  List<String> _images = [
    AppAssetsPath.onboarding1Image,
    AppAssetsPath.onboarding2Image,
    AppAssetsPath.onboarding3Image,
  ];

  void _skipOnboarding() {
    setState(() {
      if (_currentPageIndex < 2) {
        _currentPageIndex++;
      } else {
        Navigator.pushReplacementNamed(context, SplashScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeWhiteColor,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: screenHeight(context) * 0.55,
                  width: double.infinity,
                  color: _backgroundColors[_currentPageIndex],
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    _images[_currentPageIndex],
                    height: screenHeight(context) * 0.40,
                    width: screenHeight(context) * 0.35,
                    fit: BoxFit.contain,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                SizedBox(height: 50.h),
                Text(
                  _titles[_currentPageIndex],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.themeColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    _descriptions[_currentPageIndex],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildDot(_currentPageIndex == 0),
                    buildDot(_currentPageIndex == 1),
                    buildDot(_currentPageIndex == 2),
                  ],
                ),
                SizedBox(height: 50.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ThemeButton(
                    label: 'Skip',
                    onPressed: _skipOnboarding,
                    bgColor: AppColors.themeWhiteColor,
                    textColor: AppColors.themeColor,
                    borderColor: AppColors.themeColor,
                    borderWidth: 1.w,
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ThemeButton(
                    bgColor: AppColors.themeColor,
                    textColor: AppColors.themeWhiteColor,
                    borderColor: AppColors.themeWhiteColor,
                    label: 'Sign Up',
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, SplashScreen.routeName);
                    },
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

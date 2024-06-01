import 'package:dr_office_management/presentation/views/authentication/login_sigup_screen.dart';
import 'package:flutter/material.dart';
import 'package:dr_office_management/data/constants/app_colors.dart';
import 'package:dr_office_management/data/constants/assets_path.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacementNamed(context, LoginSignupScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeColor,
      body: Center(
        child: Image.asset(AppAssetsPath.logo),
      ),
    );
  }
}

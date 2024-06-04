import 'package:dr_office_management/presentation/viewmodels/user_provider.dart';
import 'package:dr_office_management/presentation/views/authentication/login_sigup_screen.dart';
import 'package:dr_office_management/presentation/views/authentication/sign_in_screen.dart';
import 'package:dr_office_management/presentation/views/authentication/sign_up_screen.dart';
import 'package:dr_office_management/presentation/views/dashboard/home_screen.dart';
import 'package:dr_office_management/presentation/views/dashboard/tab_screen.dart';
import 'package:dr_office_management/presentation/views/doctor_profile_screen/doctor_profile_screen.dart';
import 'package:dr_office_management/presentation/views/favorite/favorite_screen.dart';
import 'package:dr_office_management/presentation/views/notification/notification_screen.dart';
import 'package:dr_office_management/presentation/views/onboarding/onboarding_screen_one.dart';
import 'package:dr_office_management/presentation/views/onboarding/splash_screen.dart';
import 'package:dr_office_management/presentation/views/speciality_doctors_screen/speciality_doctors_screen.dart';
import 'package:dr_office_management/presentation/views/top_doctors/top_doctors.screen.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          return MaterialApp(
            title: 'Doctor Office Management',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            initialRoute: OnboardingScreen.routeName,
            routes: {
              SplashScreen.routeName: (context) => SplashScreen(),
              OnboardingScreen.routeName: (context) => OnboardingScreen(),
              LoginSignupScreen.routeName: (context) => LoginSignupScreen(),
              SignInScreen.routeName: (context) => SignInScreen(),
              SignUpScreen.routeName: (context) => SignUpScreen(),
              TabScreen.routeName: (context) => const TabScreen(),
              HomeScreen.routeName: (context) => HomeScreen(),
              FavoriteScreen.routeName: (context) => const FavoriteScreen(),
              TopDoctorsScreen.routeName: (context) => const TopDoctorsScreen(),
              SpecialityDoctorsScreen.routeName: (context) =>
                  const SpecialityDoctorsScreen(),
              NotificationScreen.routeName: (context) =>
                  const NotificationScreen(),
              DoctorProfileScreen.routeName: (context) => DoctorProfileScreen(),
            },
          );
        },
      ),
    );
  }
}

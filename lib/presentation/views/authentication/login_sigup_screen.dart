import 'package:dr_office_management/data/constants/assets_path.dart';
import 'package:dr_office_management/presentation/views/authentication/sign_in_screen.dart';
import 'package:dr_office_management/presentation/views/authentication/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:dr_office_management/data/constants/app_colors.dart';
import 'package:dr_office_management/presentation/widgets/theme_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginSignupScreen extends StatelessWidget {
  static const String routeName = '/login_signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeWhiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Spacer(),
            Image.asset(
              AppAssetsPath.logo,
              height: 100.h,
              color: AppColors.themeColor,
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ThemeButton(
                label: 'Sign up',
                onPressed: () {
                  Navigator.pushNamed(context, SignUpScreen.routeName);
                },
                bgColor: AppColors.themeColor,
                textColor: AppColors.themeWhiteColor,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 32.w, 16.h),
              child: ThemeButton(
                label: 'Sign in',
                onPressed: () {
                  Navigator.pushNamed(context, SignInScreen.routeName);
                },
                bgColor: AppColors.themeWhiteColor,
                textColor: AppColors.themeColor,
                borderColor: AppColors.themeColor,
                borderWidth: 1.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

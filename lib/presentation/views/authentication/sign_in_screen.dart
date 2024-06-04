import 'package:dr_office_management/data/constants/app_colors.dart';
import 'package:dr_office_management/data/constants/assets_path.dart';
import 'package:dr_office_management/data/constants/constants.dart';
import 'package:dr_office_management/presentation/viewmodels/user_provider.dart';
import 'package:dr_office_management/presentation/views/authentication/sign_up_screen.dart';

import 'package:dr_office_management/presentation/views/dashboard/tab_screen.dart';
import 'package:dr_office_management/presentation/widgets/loading_widget.dart';
import 'package:dr_office_management/presentation/widgets/theme_button.dart';
import 'package:dr_office_management/presentation/widgets/theme_text_form_feild.dart';
import 'package:dr_office_management/utils/mixins/app_mixin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = '/sign_in';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _isLoading = false;

  void _submit(UserProvider userProvider, BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });

      try {
        await userProvider.loginUser(_email, _password);
        print('Sig _email: $_email');
        print('Sig _email: $_password');

        setState(() {
          _isLoading = false;
        });
        Navigator.pushNamedAndRemoveUntil(
          context,
          TabScreen.routeName,
          (route) => false,
        );
      } catch (error) {
        print('Sign-in failed: $error');
        setState(() {
          _isLoading = false;
        });
        showLoginErrorDialog(context);
      }
    }
  }

  void showLoginErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Failed'),
          content: Text('Invalid email or password. Please try again.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeWhiteColor,
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: Consumer<UserProvider>(
              builder: (context, userProvider, _) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 70.h,
                        ),
                        Center(
                          child: Image.asset(
                            AppAssetsPath.logo,
                            height: 100.sp,
                            width: 100.sp,
                            color: AppColors.themeColor,
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Center(
                          child: Text(
                            'Sign In',
                            style: textStyleTitle(),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          child: Text(
                            'Email',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ),
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
                          child: Text(
                            'Password',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        ThemeTextField(
                          labelText: 'Password',
                          isObscure: true,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _password = value!;
                          },
                        ),
                        SizedBox(height: 40.h),
                        ThemeButton(
                          onPressed: () => _submit(userProvider, context),
                          label: 'Sign In',
                        ),
                        SizedBox(height: 10.h),
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password ?',
                              style: TextStyle(
                                  color: AppColors.themeColor, fontSize: 14.sp),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Center(
                            child: Text(
                          'or continue with',
                          style: TextStyle(fontSize: 14.sp),
                        )),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(
                                      color: AppColors.themeLightGrey,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(width: 10.w),
                                        Image.asset(
                                          AppAssetsPath.facebook,
                                          height: 24.h,
                                          width: 24.h,
                                          fit: BoxFit.contain,
                                        ),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: Text(
                                            'Facebook',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(
                                      color: AppColors.themeLightGrey,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(width: 10.w),
                                        Image.asset(
                                          AppAssetsPath.google,
                                          height: 24.h,
                                          width: 24.h,
                                          fit: BoxFit.contain,
                                        ),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: Text(
                                            'Google',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Center(
                          child: Text.rich(
                            TextSpan(
                              text: 'Don’t have an account? ',
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Sign Up',
                                  style: TextStyle(color: AppColors.themeColor),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(
                                          context, SignUpScreen.routeName);
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black54,
              child: Center(
                child: LoadingIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}

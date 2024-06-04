import 'package:dr_office_management/data/constants/app_colors.dart';
import 'package:dr_office_management/data/constants/assets_path.dart';
import 'package:dr_office_management/data/constants/constants.dart';
import 'package:dr_office_management/presentation/widgets/servce_widget.dart';
import 'package:dr_office_management/presentation/widgets/theme_button.dart';
import 'package:dr_office_management/presentation/widgets/time_widget.dart';

import 'package:dr_office_management/utils/mixins/app_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorProfileScreen extends StatefulWidget {
  static const String routeName = '/profile';

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeWhiteColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.themeColor,
                      size: 20.h,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(width: 16.w),
                  Text(
                    'Doctorek',
                    style: textStyleTitle(),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.themeMaterialColor.shade100
                          .withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: AppColors.themeColor,
                        size: 20.h,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.themeMaterialColor.shade100
                          .withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.share,
                        color: AppColors.themeColor,
                        size: 20.h,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50.h,
                    child: ClipOval(
                      child: SizedBox(
                        width: 100.h,
                        height: 100.h,
                        child: Image.asset(
                          AppAssetsPath.maleProfilePicture,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Dr. John Doe',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                  Text(
                    'Cardiologist',
                    style: TextStyle(
                      color: AppColors.textGrayColor,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ServiceWidget(
                    icon: Icons.people_outline,
                    title: 'Services',
                    subTitle: 'Consultation',
                    iconColor: Colors.blue.shade400,
                    boxColor: Colors.blue.shade100,
                  ),
                  ServiceWidget(
                    icon: Icons.track_changes,
                    title: 'Speciality',
                    subTitle: 'Cardiology',
                    iconColor: Colors.pink.shade400,
                    boxColor: Colors.pink.shade100,
                  ),
                  ServiceWidget(
                    icon: Icons.star_outline,
                    title: 'Experience',
                    subTitle: '10 years',
                    iconColor: Colors.orange.shade400,
                    boxColor: Colors.orange.shade100,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Doctor',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Dr. John Doe is a highly skilled and experienced cardiologist with a passion for helping patients improve their heart health.',
                    style: TextStyle(
                      color: AppColors.textGrayColor,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Working time',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Mon - Sat (08:30 AM - 09:00 PM)',
                    style: TextStyle(
                      color: AppColors.textGrayColor,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Make appointment',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TimeWidget(day: 'Mon', weekDay: '13'),
                      TimeWidget(day: 'Tue', weekDay: '14'),
                      TimeWidget(day: 'Wed', weekDay: '15'),
                      TimeWidget(day: 'Thu', weekDay: '16'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            ThemeButton(
              onPressed: () {},
              label: 'Book Appointment',
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:dr_office_management/data/constants/app_colors.dart';
import 'package:dr_office_management/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeWidget extends StatelessWidget {
  final String day;
  final String weekDay;

  const TimeWidget({
    Key? key,
    required this.day,
    required this.weekDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context) * 0.2,
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.themeLightGrey),
        borderRadius: BorderRadius.circular(8.h),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              weekDay,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              day,
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

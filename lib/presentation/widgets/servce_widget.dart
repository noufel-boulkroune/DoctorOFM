import 'package:dr_office_management/data/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final Color iconColor;
  final Color boxColor;

  const ServiceWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.iconColor,
    required this.boxColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: AppColors.themeWhiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10.w),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 50.w,
            height: 70.w,
            decoration: BoxDecoration(
              color: boxColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.w),
                bottomRight: Radius.circular(10.w),
              ),
            ),
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Icon(
                icon,
                color: iconColor,
                size: 30.sp,
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
          Text(
            subTitle,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}

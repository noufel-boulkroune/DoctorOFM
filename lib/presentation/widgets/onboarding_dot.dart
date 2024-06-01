import 'package:dr_office_management/data/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

Widget buildDot(bool isActive) {
  return Container(
    margin: EdgeInsets.only(right: 12.w),
    width: isActive ? 8.w : 6.w,
    height: isActive ? 8.w : 6.w,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: isActive ? AppColors.themeColor : AppColors.themeLightGrey,
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHomeSpeciality extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color color;
  final double iconSize;

  const CustomHomeSpeciality({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.color,
    required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8.h),
              ),
              padding: EdgeInsets.all(16.h),
              child: Image.asset(
                imagePath,
                color: Colors.white,
                height: iconSize,
                width: iconSize,
              ),
            ),
            Positioned(
              top: -30.h,
              left: -30.h,
              child: Container(
                width: 50.h,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0.h),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Flexible(
          child: Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 12.sp),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

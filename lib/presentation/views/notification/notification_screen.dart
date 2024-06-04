import 'package:dr_office_management/data/constants/app_colors.dart';
import 'package:dr_office_management/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:dr_office_management/presentation/widgets/notification_card.dart';

class NotificationScreen extends StatefulWidget {
  static const String routeName = '/notification';

  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Notifications'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (index == 0 ||
                    notifications[index]['date'] !=
                        notifications[index - 1]['date'])
                  Padding(
                    padding: EdgeInsets.only(top: index == 0 ? 0 : 16.h),
                    child: Text(
                      notifications[index]['date']!,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textGrayColor),
                    ),
                  ),
                SizedBox(
                  height: 16.h,
                ),
                NotificationCard(
                  title: notifications[index]['title']!,
                  description: notifications[index]['description']!,
                  imagePath: notifications[index]['image']!,
                ),
                SizedBox(height: 16.h),
              ],
            );
          },
        ),
      ),
    );
  }
}

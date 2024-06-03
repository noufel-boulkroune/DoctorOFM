import 'package:dr_office_management/data/constants/assets_path.dart';
import 'package:dr_office_management/data/constants/constants.dart';
import 'package:dr_office_management/data/models/user_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorInfoWidget extends StatelessWidget {
  final UserModel userModel;

  const DoctorInfoWidget({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 140.w,
      margin: EdgeInsets.symmetric(horizontal: 10.0.h),
      padding: EdgeInsets.all(10.0.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            child: ClipOval(
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(
                  userModel.gender == Gender.Male.name
                      ? AppAssetsPath.maleProfilePicture
                      : AppAssetsPath.femaleProfilePicture,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Flexible(
            child: Text(
              userModel.name,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 5.h),
          Flexible(
              child: Text(
            userModel.areaOfExpertise,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )),
          Flexible(
              child: Text(
            userModel.review,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )),
        ],
      ),
    );
  }
}

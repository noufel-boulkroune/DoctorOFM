import 'package:dr_office_management/data/constants/app_colors.dart';
import 'package:dr_office_management/data/constants/assets_path.dart';
import 'package:dr_office_management/data/constants/constants.dart';
import 'package:dr_office_management/data/models/user_model.dart';
import 'package:dr_office_management/presentation/widgets/doctor_card.dart';
import 'package:dr_office_management/presentation/widgets/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorFavoriteWidget extends StatelessWidget {
  final UserModel userModel;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onRemove;

  const DoctorFavoriteWidget({
    Key? key,
    required this.userModel,
    required this.isFavorite,
    required this.onFavoriteToggle,
    this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 140.w,
      margin: EdgeInsets.symmetric(horizontal: 10.0.h),
      padding: EdgeInsets.all(10.0.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 15.h),
              CircleAvatar(
                radius: 50,
                child: ClipOval(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      userModel.gender == 'Male'
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
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
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
                ),
              ),
              Flexible(
                child: Text(
                  userModel.review,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 25.h,
              width: 25.h,
              decoration: BoxDecoration(
                color: AppColors.themeMaterialColor.shade100.withOpacity(0.5),
                borderRadius: BorderRadius.circular(13.0),
              ),
              child: Center(
                child: GestureDetector(
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: AppColors.themeColor,
                    size: 15.h,
                  ),
                  onTap: () {
                    if (onRemove != null && isFavorite) {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: EdgeInsets.all(16.0.w),
                            // color: Colors.white,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 20.h),
                                DoctorCard(
                                  userModel: userModel,
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  'Remove from favorites?',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ThemeButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        bgColor: Colors.white,
                                        textColor: AppColors.themeColor,
                                        borderColor: AppColors.themeColor,
                                        borderWidth: 1,
                                        weidth: screenWidth(context) * 0.40,
                                        label: "Cancel"),
                                    SizedBox(width: 20.w),
                                    ThemeButton(
                                        onPressed: () {
                                          onRemove!();
                                          Navigator.pop(context);
                                        },
                                        weidth: screenWidth(context) * 0.40,
                                        label: "Yes, Remove")
                                  ],
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      onFavoriteToggle!();
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

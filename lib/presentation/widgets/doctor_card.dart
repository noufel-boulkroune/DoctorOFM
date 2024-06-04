import 'package:flutter/material.dart';
import 'package:dr_office_management/data/constants/app_colors.dart';
import 'package:dr_office_management/data/constants/assets_path.dart';
import 'package:dr_office_management/data/models/user_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palette_generator/palette_generator.dart';

class DoctorCard extends StatefulWidget {
  final UserModel userModel;

  const DoctorCard({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  _DoctorCardState createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  Color? dominantColor;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _updatePalette();
  }

  Future<void> _updatePalette() async {
    final PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
      AssetImage(
        widget.userModel.gender == 'Male'
            ? AppAssetsPath.maleProfilePicture
            : AppAssetsPath.femaleProfilePicture,
      ),
    );
    setState(() {
      dominantColor = generator.dominantColor?.color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Container(
            width: 80.h,
            height: 80.h,
            decoration: BoxDecoration(
              color: dominantColor ?? Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
              child: Image.asset(
                widget.userModel.gender == 'Male'
                    ? AppAssetsPath.maleProfilePicture
                    : AppAssetsPath.femaleProfilePicture,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    widget.userModel.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    widget.userModel.review,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    widget.userModel.areaOfExpertise,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.themeMaterialColor.shade100.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: AppColors.themeColor,
              ),
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
            ),
          ),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
    );
  }
}

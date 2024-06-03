import 'package:dr_office_management/data/constants/app_colors.dart';
import 'package:dr_office_management/data/constants/assets_path.dart';
import 'package:dr_office_management/data/constants/constants.dart';
import 'package:dr_office_management/data/models/user_model.dart';

import 'package:dr_office_management/presentation/viewmodels/user_provider.dart';
import 'package:dr_office_management/presentation/views/favorite/favorite_screen.dart';
import 'package:dr_office_management/presentation/views/speciality_doctors_screen/speciality_doctors_screen.dart';
import 'package:dr_office_management/presentation/views/top_doctors/top_doctors.screen.dart';
import 'package:dr_office_management/presentation/widgets/custom_home_speciality.dart';
import 'package:dr_office_management/presentation/widgets/doctor_info_widget.dart';
import 'package:dr_office_management/utils/mixins/app_mixin.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    IconButton(
                      icon: Image.asset(
                        AppAssetsPath.logo,
                        height: 30.h,
                        width: 30.h,
                        color: AppColors.themeColor,
                      ),
                      onPressed: () {},
                    ),
                    const Spacer(),
                    Text(
                      'Doctorek',
                      style: textStyleTitle(),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.themeMaterialColor.shade100
                            .withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.notifications,
                          color: AppColors.themeColor,
                        ),
                        onPressed: () {
                          final userProvider =
                              Provider.of<UserProvider>(context, listen: false);
                          userProvider.fetchDoctors();
                        },
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.themeMaterialColor.shade100
                            .withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.favorite,
                          color: AppColors.themeColor,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, FavoriteScreen.routeName);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Find',
                        style: TextStyle(
                            color: AppColors.textFieldTextColor,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                            fontSize: 20),
                      ),
                      TextSpan(
                        text: ' your doctor',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColors.textGrayColor,
                            letterSpacing: 2,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'Search',
                    suffixIcon: const Icon(Icons.search),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20.0),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Special Doctors',
                      style: textStyleHomeTitle(),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, SpecialityDoctorsScreen.routeName);
                      },
                      child: const Text('View All',
                          style: TextStyle(color: AppColors.themeColor)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                  ),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomHomeSpeciality(
                      icon: items[index].icon,
                      text: items[index].text,
                      color: items[index].color,
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Doctors',
                      style: textStyleTitle(),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, TopDoctorsScreen.routeName);
                      },
                      child: const Text(
                        'View All',
                        style: TextStyle(color: AppColors.themeColor),
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder<List<UserModel>>(
                future: Provider.of<UserProvider>(context).fetchDoctors(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    List<UserModel> doctors = snapshot.data ?? [];
                    return SizedBox(
                      height: 200.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: doctors.length,
                        itemBuilder: (BuildContext context, int index) {
                          return DoctorInfoWidget(userModel: doctors[index]);
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

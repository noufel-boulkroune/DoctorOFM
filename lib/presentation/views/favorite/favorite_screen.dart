import 'package:dr_office_management/data/constants/app_colors.dart';
import 'package:dr_office_management/data/constants/constants.dart';
import 'package:dr_office_management/data/models/user_model.dart';
import 'package:dr_office_management/presentation/widgets/doctor_favorite_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteScreen extends StatefulWidget {
  static const String routeName = '/favorite';

  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<String> favoriteDoctorIds = [];
  List<UserModel> filteredDoctors = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadFavoriteDoctorIds();
    filteredDoctors = doctorsList;
    searchController.addListener(_filterDoctors);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> _loadFavoriteDoctorIds() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      favoriteDoctorIds = prefs.getStringList('favoriteDoctorIds') ?? [];
    });
  }

  Future<void> _saveFavoriteDoctorIds() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favoriteDoctorIds', favoriteDoctorIds);
  }

  void onFavoriteToggle(UserModel doctor) {
    setState(() {
      if (favoriteDoctorIds.contains(doctor.id)) {
        favoriteDoctorIds.remove(doctor.id);
      } else {
        favoriteDoctorIds.add(doctor.id);
      }
      _saveFavoriteDoctorIds();
    });
  }

  void _removeFromFavorites(UserModel doctor) {
    setState(() {
      favoriteDoctorIds.remove(doctor.id);
      _saveFavoriteDoctorIds();
    });
  }

  void _filterDoctors() {
    setState(() {
      String query = searchController.text.toLowerCase();
      filteredDoctors = doctorsList.where((doctor) {
        return doctor.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Doctors"),
        actions: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.themeMaterialColor.shade100.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.favorite,
                color: AppColors.themeColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, FavoriteScreen.routeName);
              },
            ),
          ),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
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
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: filteredDoctors.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.w,
              ),
              itemBuilder: (BuildContext context, int index) {
                UserModel doctor = filteredDoctors[index];
                bool isFavorite = favoriteDoctorIds.contains(doctor.id);
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: DoctorFavoriteWidget(
                    userModel: doctor,
                    isFavorite: isFavorite,
                    onFavoriteToggle: () => onFavoriteToggle(doctor),
                    onRemove: () => _removeFromFavorites(doctor),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

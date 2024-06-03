import 'package:dr_office_management/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dr_office_management/data/constants/constants.dart';
import 'package:dr_office_management/presentation/widgets/doctor_card.dart';

class TopDoctorsScreen extends StatefulWidget {
  static const String routeName = '/top_doctors';

  const TopDoctorsScreen({Key? key}) : super(key: key);

  @override
  _TopDoctorsScreenState createState() => _TopDoctorsScreenState();
}

class _TopDoctorsScreenState extends State<TopDoctorsScreen> {
  String _searchQuery = '';
  late List<UserModel> filteredDoctors;

  @override
  void initState() {
    super.initState();
    _filterDoctors();
  }

  void _filterDoctors() {
    setState(() {
      String query = _searchQuery.toLowerCase();
      filteredDoctors = doctorsList.where((doctor) {
        return doctor.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Doctors'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                  _filterDoctors();
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                hintText: 'Search for doctors...',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 20.0,
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: filteredDoctors.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 16.h,
                  );
                },
                itemBuilder: (context, index) {
                  final doctor = filteredDoctors[index];
                  return DoctorCard(
                    userModel: doctor,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

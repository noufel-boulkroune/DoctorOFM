import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dr_office_management/presentation/widgets/custom_speciality.dart';
import 'package:dr_office_management/data/constants/constants.dart';

class SpecialityDoctorsScreen extends StatefulWidget {
  static const String routeName = '/speciality_doctors';

  const SpecialityDoctorsScreen({Key? key}) : super(key: key);

  @override
  _SpecialityDoctorsScreenState createState() =>
      _SpecialityDoctorsScreenState();
}

class _SpecialityDoctorsScreenState extends State<SpecialityDoctorsScreen> {
  String _searchQuery = '';
  List _filteredItems = List.from(items);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speciality Doctors'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value.toLowerCase();
                    _filterItems(); // Call method to filter items based on search query
                  });
                },
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
                    vertical: 15.0,
                    horizontal: 20.0,
                  ),
                ),
                style: const TextStyle(color: Colors.black),
              ),
              SizedBox(height: 16.h),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                ),
                itemCount: _filteredItems.length, // Use filtered items count
                itemBuilder: (BuildContext context, int index) {
                  final item = _filteredItems[index];

                  return CustomSpeciality(
                    icon: item.icon,
                    text: item.text,
                    color: item.color,
                    iconSize: 48.0,
                    containerSize: screenWidth(context) * 0.4,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _filterItems() {
    _filteredItems = items
        .where((item) =>
            item.text.toLowerCase().contains(_searchQuery) ||
            item.text.toLowerCase().startsWith(_searchQuery))
        .toList();
  }
}

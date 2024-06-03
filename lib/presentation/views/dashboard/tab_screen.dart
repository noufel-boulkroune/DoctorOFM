import 'package:dr_office_management/data/constants/app_colors.dart';
import 'package:dr_office_management/presentation/views/dashboard/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabScreen extends StatefulWidget {
  static const String routeName = '/tab';

  const TabScreen({
    Key? key,
    this.selectedIndex,
  }) : super(key: key);

  final int? selectedIndex;

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<bool> _showText;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: widget.selectedIndex ?? 0,
    );
    _tabController.addListener(_handleTabSelection);
    _showText = List.generate(4, (_) => false);
    _showText[_tabController.index] = true;
  }

  void _handleTabSelection() {
    setState(() {
      _showText = List.generate(4, (_) => false);
      _showText[_tabController.index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          HomeScreen(),
          Container(color: Colors.blue),
          Container(color: Colors.green),
          Container(color: Colors.orange),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          _buildBottomNavigationBarItem(
              Icons.home, Icons.home_outlined, 'Home', 0),
          _buildBottomNavigationBarItem(
              Icons.favorite, Icons.favorite_outline, 'Favorite', 1),
          _buildBottomNavigationBarItem(
              Icons.chat, Icons.chat_outlined, 'Chat', 2),
          _buildBottomNavigationBarItem(
              Icons.person, Icons.person_outline, 'Profile', 3),
        ],
        currentIndex: _tabController.index,
        onTap: (index) {
          _tabController.animateTo(index);
        },
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData icon, IconData iconOutlined, String label, int index) {
    return BottomNavigationBarItem(
      icon: _showText[index]
          ? Container(
              decoration: BoxDecoration(
                color: AppColors.themeColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: AppColors.themeColor,
                    ),
                    SizedBox(width: 5.w),
                    Flexible(
                      child: Text(
                        label,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.themeColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Icon(
              iconOutlined,
              color: AppColors.themeColor,
            ),
      label: '',
    );
  }
}

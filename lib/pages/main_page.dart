import 'package:flutter/material.dart';
import 'package:healthy_step/constants/colors.dart';
import 'package:healthy_step/constants/custom_icons.dart';
import 'package:healthy_step/pages/food_page.dart';
import 'package:healthy_step/pages/home_page.dart';
import 'package:healthy_step/pages/profile_page.dart';
import 'package:healthy_step/pages/report_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final _screens = [
    HomePage(),
    ReportPage(),
    FoodPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.2),
              blurRadius: 15,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          child: SizedBox(
            height: 75,
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: customContainerColor,
              unselectedIconTheme: IconThemeData(size: 30),
              unselectedItemColor: Colors.white60,
              unselectedFontSize: 18,
              selectedItemColor: customRedColor,
              selectedIconTheme: IconThemeData(size: 30),
              selectedFontSize: 18,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(CustomIcons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CustomIcons.report),
                  label: 'Report',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CustomIcons.food),
                  label: 'Food',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CustomIcons.profile),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

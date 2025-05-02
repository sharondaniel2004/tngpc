// ignore_for_file: deprecated_member_use, file_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tngpc/constants/theme.dart';
import 'package:tngpc/tracker/Screens/TrackerHomepage.dart';
import 'package:tngpc/tracker/Screens/TrackerProfilepage.dart';

class TrackerBottomNavBar extends StatefulWidget {
  const TrackerBottomNavBar({super.key});

  @override
  State<TrackerBottomNavBar> createState() => _TrackerBottomNavBarState();
}

class _TrackerBottomNavBarState extends State<TrackerBottomNavBar> {
  int currentIndex = 0;
  final Screens = [
    const TrackerHomepage(), // Removed the data parameter
    const TrackerProfilepage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: currentIndex,
        backgroundColor: tWhite,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: tBlue,
          height: 1.5,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: tBlack.withOpacity(0.4),
          height: 1.5,
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: tBlack.withOpacity(0.4),
        selectedItemColor: tBlue,
        iconSize: 16,
        onTap: (index) => setState(
          () {
            currentIndex = index;
          },
        ),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.network(
              'https://www.svgrepo.com/show/522891/home-angle-2.svg',
              height: 24,
              width: 24,
              color: tBlack.withOpacity(0.4),
            ),
            label: 'Home',
            activeIcon: SvgPicture.network(
              'https://www.svgrepo.com/show/522891/home-angle-2.svg',
              height: 24,
              width: 24,
              color: tBlue,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.network(
              'https://www.svgrepo.com/show/522595/menu-2.svg',
              height: 24,
              width: 24,
              color: tBlack.withOpacity(0.4),
            ),
            label: 'Profile',
            activeIcon: SvgPicture.network(
              'https://www.svgrepo.com/show/522595/menu-2.svg',
              height: 24,
              width: 24,
              color: tBlue,
            ),
          ),
        ],
      ),
    );
  }
}

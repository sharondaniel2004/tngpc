// ignore_for_file: deprecated_member_use, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tngpc/constants/theme.dart';
import 'package:tngpc/user/Screens/Homepage.dart';
import 'package:tngpc/user/Screens/UserMenuPage.dart';
import 'package:tngpc/user/Screens/UserProfile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int CurrentIndex = 0;

  final Screens = [
    const userHomepage(),
    const UserMenuPage(),
    const UserprofileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[CurrentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: tBlack,
              width: 0.1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: CurrentIndex,
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
          onTap: (index) => setState(() {
            CurrentIndex = index;
          }),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.network(
                'https://www.svgrepo.com/show/522891/home-angle-2.svg',
                height: 22,
                width: 22,
                color: tBlack.withOpacity(0.4),
              ),
              activeIcon: SvgPicture.network(
                'https://www.svgrepo.com/show/522891/home-angle-2.svg',
                height: 22,
                width: 22,
                color: tBlue,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.network(
                'https://www.svgrepo.com/show/522595/menu-2.svg',
                height: 22,
                width: 22,
                color: tBlack.withOpacity(0.4),
              ),
              activeIcon: SvgPicture.network(
                'https://www.svgrepo.com/show/522595/menu-2.svg',
                height: 22,
                width: 22,
                color: tBlue,
              ),
              label: 'Menu',
            ),
            // BottomNavigationBarItem(
            //   icon: SvgPicture.network(
            //     'https://www.svgrepo.com/show/505808/user-question.svg',
            //     height: 22,
            //     width: 22,
            //     color: tBlack.withOpacity(0.4),
            //   ),
            //   activeIcon: SvgPicture.network(
            //     'https://www.svgrepo.com/show/505808/user-question.svg',
            //     height: 22,
            //     width: 22,
            //     color: tBlue,
            //   ),
            //   label: 'Feedback',
            // ),
            BottomNavigationBarItem(
              icon: SvgPicture.network(
                'https://www.svgrepo.com/show/498298/profile.svg',
                height: 22,
                width: 22,
                color: tBlack.withOpacity(0.4),
              ),
              activeIcon: SvgPicture.network(
                'https://www.svgrepo.com/show/498298/profile.svg',
                height: 22,
                width: 22,
                color: tBlue,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

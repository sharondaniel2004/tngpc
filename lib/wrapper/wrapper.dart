import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tngpc/auth/login_page.dart';
import 'package:tngpc/authentication_type/authentication_page.dart';
import 'package:tngpc/constants/BottomNavBar.dart';
import 'package:tngpc/constants/TrackerBottomNavBar.dart';
import 'package:tngpc/constants/splash_page.dart';
import 'package:tngpc/constants/theme.dart';
import 'package:tngpc/main.dart';
import 'package:tngpc/onboarding/onboarding_page.dart';
import 'package:tngpc/user/Screens/Homepage.dart';
import 'package:tngpc/user/Screens/UserMenuPage.dart';
import 'package:tngpc/user/Screens/UserProfile.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TNGPC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: tBlue,
        ),
        useMaterial3: true,
      ),
      routes: {
        "userhomepage": (c) => const userHomepage(),
        "usermenupage": (c) => const UserMenuPage(),
        "userprofilepage": (c) => const UserprofileScreen(),
        "userbottomnavbar": (c) => const BottomNavBar(),
        "adminbottomnavbar": (c) => const TrackerBottomNavBar(),
        "authenticationtypepage": (c) => const AuthenticationTypePage(),
        "loginpage": (c) => const LogInPage(),
      },
      home: isviewed != 0 ? const OnBoardingScreen() : const SplashPage(),
    );
  }
}

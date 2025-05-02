import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tngpc/authentication_type/authentication_button.dart';
import 'package:tngpc/constants/theme.dart';

class AuthenticationTypePage extends StatefulWidget {
  const AuthenticationTypePage({super.key});

  @override
  State<AuthenticationTypePage> createState() => _AuthenticationTypePageState();
}

class _AuthenticationTypePageState extends State<AuthenticationTypePage> {
  void updateSelectedUserType(String userType) {
    setState(() {
      selectedType = userType;
    });
  }

  String selectedType = '';
  void slectedUserTypeNavigation(String userType) {
    setState(() {
      selectedType = userType;
    });

    if (selectedType == 'User') {
      Get.toNamed("userbottomnavbar");
    } else if (selectedType == 'Admin') {
      Get.toNamed("adminbottomnavbar");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhite,
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "TNGPC",
                  style: GoogleFonts.poppins(
                    fontSize: 42,
                    fontWeight: FontWeight.w600,
                    color: tBlue,
                  ),
                ),
                const Gap(10),
                Text(
                  "Truth Alone Triumphs",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    // ignore: deprecated_member_use
                    color: tBlack.withOpacity(0.3),
                  ),
                ),
                const Gap(30),
                Text(
                  "Please select your user type",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    // ignore: deprecated_member_use
                    color: tBlack.withOpacity(0.5),
                  ),
                ),
                const Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LogInTypeButton(
                      icnLink:
                          'https://www.svgrepo.com/show/532363/user-alt-1.svg',
                      logintxt: 'User',
                      onTap: (userType) async {
                        slectedUserTypeNavigation(userType);
                        HapticFeedback.lightImpact();
                      },
                      selected: selectedType == 'User',
                    ),
                    const Gap(30),
                    LogInTypeButton(
                      icnLink:
                          'https://www.svgrepo.com/show/504002/police-security-policeman.svg',
                      logintxt: 'Admin',
                      onTap: (userType) async {
                        slectedUserTypeNavigation(userType);
                        HapticFeedback.lightImpact();
                      },
                      selected: selectedType == 'Admin',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

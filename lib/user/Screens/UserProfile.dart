// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:tngpc/constants/theme.dart';

class UserprofileScreen extends StatefulWidget {
  const UserprofileScreen({super.key});

  @override
  State<UserprofileScreen> createState() => _UserprofileScreenState();
}

class _UserprofileScreenState extends State<UserprofileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tBlue,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: tWhite,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: tWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75,
              backgroundColor: tBlack,
              backgroundImage: NetworkImage(
                FirebaseAuth.instance.currentUser!.photoURL.toString(),
              ),
            ),
            const Gap(
              10,
            ),
            Text(
              FirebaseAuth.instance.currentUser!.email.toString(),
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  // ignore: deprecated_member_use
                  color: tBlack.withOpacity(0.7),
                  fontWeight: FontWeight.w600),
            ),
            const Gap(10),
            Text(
              FirebaseAuth.instance.currentUser!.displayName.toString(),
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  // ignore: deprecated_member_use
                  color: tBlack.withOpacity(0.7),
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

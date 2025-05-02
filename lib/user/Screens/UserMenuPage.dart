// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tngpc/constants/theme.dart';
import 'package:tngpc/user/components/Beverages_Tabview.dart';
import 'package:tngpc/user/components/DairyEggs_Tabview.dart';
import 'package:tngpc/user/components/Household%20Care_Tabview.dart';
import 'package:tngpc/user/components/KitchenProduct_Tabview.dart';
import 'package:tngpc/user/components/PersonalCare_Tabview.dart';
import 'package:tngpc/user/components/Staples_Tabview.dart';
import 'package:tngpc/user/components/Stationery_Tabview.dart';

class UserMenuPage extends StatefulWidget {
  const UserMenuPage({super.key});

  @override
  State<UserMenuPage> createState() => _UserMenuPageState();
}

class _UserMenuPageState extends State<UserMenuPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 7, vsync: this);

    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: tBlack.withOpacity(0.02),
      appBar: AppBar(
        backgroundColor: tBlue,
        centerTitle: false,
        title: Text(
          'Menu',
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w600, color: tWhite),
        ),
        automaticallyImplyLeading: false,
        bottom: TabBar(
          tabAlignment: TabAlignment.center,
          labelColor: tWhite,
          // ignore: deprecated_member_use
          unselectedLabelColor: tWhite.withOpacity(0.6),
          controller: tabController,
          indicatorColor: tBlue,
          indicatorWeight: 3,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: tBlue,
          ),
          isScrollable: true,
          tabs: const [
            Tab(
              text: 'Beverages',
            ),
            Tab(
              text: 'Dairy & Eggs',
            ),
            Tab(
              text: 'Household care',
            ),
            Tab(
              text: 'Kitchen products',
            ),
            Tab(
              text: 'Personal care',
            ),
            Tab(
              text: 'Staple',
            ),
            Tab(
              text: 'Stationarys',
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TabBarView(
          controller: tabController,
          children: [
            BeveragesTabview(),
            DairyEggsTabView(),
            householdcareTabview(),
            KitchenTabView(),
            personalcareTabview(),
            StapleTabView(),
            stationeryTabview()
          ],
        ),
      ),
    );
  }
}

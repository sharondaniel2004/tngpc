// ignore_for_file: unused_local_variable, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tngpc/constants/theme.dart';
import 'package:tngpc/database/UserDataUpload.dart';

class userHomepage extends StatefulWidget {
  const userHomepage({super.key});

  @override
  State<userHomepage> createState() => _userHomepageState();
}

class _userHomepageState extends State<userHomepage> {
  UserDataUploadMango userDataUploadMango = Get.put(UserDataUploadMango());

  Color getStatusColor(String status) {
    switch (status) {
      case 'Received':
        return tBlue; // Example color for 'Received'
      case 'Processing':
        return tyellow; // Example color for 'Processing'
      case 'Completed':
        return tGreen; // Example color for 'Completed'
      default:
        return Colors.grey; // Fallback color
    }
  }

  @override
  void initState() {
    super.initState();
    userDataUploadMango.getAlldata();
    final UserDataUploadMango mongoissueController =
        Get.find<UserDataUploadMango>();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final UserDataUploadMango mongoissueController =
        Get.find<UserDataUploadMango>();

    return Scaffold(
      backgroundColor: tWhite,
      appBar: AppBar(
        backgroundColor: tBlue,
        centerTitle: true,
        title: Text(
          'TNGPC',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: tWhite,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenSize.height,
                  width: screenSize.width * 0.95,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: userDataUploadMango.allData.length,
                    itemBuilder: (context, index) {
                      final data = userDataUploadMango.allData[index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          // onTap: () {
                          //   Get.to(
                          //     TrackerDetailedPage(
                          //       data: data,
                          //       index: index,
                          //     ),
                          //   );
                          // },
                          child: Container(
                            decoration: BoxDecoration(
                              color: tWhite,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: tBlack.withOpacity(0.1),
                                width: 1.2,
                              ),
                            ),
                            height: screenSize.height * 0.25,
                            width: screenSize.width * 0.95,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Container(
                                      width: screenSize.width,
                                      height: screenSize.height * 0.03,
                                      decoration: BoxDecoration(
                                        color: getStatusColor(
                                            mongoissueController
                                                .getStatusByIndex(index)),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        mongoissueController
                                            .getStatusByIndex(index),
                                        style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: tWhite,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(5),
                                  Text(
                                    data['_id'].toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: tBlue,
                                    ),
                                  ),
                                  Text(
                                    data['items'][index]['productName']
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700,
                                      color: tBlack,
                                    ),
                                  ),
                                  Text(
                                    'Brand: ${data['items'][index]['Brandname'].toString()}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      // ignore: deprecated_member_use
                                      color: tBlack.withOpacity(0.5),
                                    ),
                                  ),
                                  const Gap(10),
                                  Row(
                                    children: [
                                      Text(
                                        '₹ ${data['items'][index]['price'].toString()}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          // ignore: deprecated_member_use
                                          color: tBlack.withOpacity(0.5),
                                        ),
                                      ),
                                      const Gap(5),
                                      Text(
                                        'Qtn: ${data['items'][index]['Quantity'].toString()}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          // ignore: deprecated_member_use
                                          color: tBlack.withOpacity(0.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Gap(5),
                                  Text(
                                    data['items'][index]['Description']
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      // ignore: deprecated_member_use
                                      color: tBlack.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

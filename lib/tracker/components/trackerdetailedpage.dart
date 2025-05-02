// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tngpc/constants/theme.dart';
import 'package:tngpc/database/UserDataUpload.dart';

class TrackerDetailedPage extends StatefulWidget {
  final dynamic data;
  final int index;
  const TrackerDetailedPage(
      {super.key, required this.data, required this.index});

  @override
  State<TrackerDetailedPage> createState() => _TrackerDetailedPageState();
}

class _TrackerDetailedPageState extends State<TrackerDetailedPage> {
  UserDataUploadMango userDataUploadMango = Get.put(UserDataUploadMango());
  double slider = 0;

  @override
  void initState() {
    super.initState();
    setInitialSlidervalue();
    final UserDataUploadMango mongoissueController =
        Get.find<UserDataUploadMango>();
    slider = userDataUploadMango.getSliderValueByIndex(widget.index);
  }

  void setInitialSlidervalue() {
    final UserDataUploadMango mongoissueController =
        Get.find<UserDataUploadMango>();

    String status = mongoissueController.getStatusByIndex(widget.index);
    slider = mongoissueController.statusToSliderValue(status);
  }

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.sizeOf(context);

    final UserDataUploadMango userDataUploadMango =
        Get.find<UserDataUploadMango>();
    return Scaffold(
      backgroundColor: tWhite,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Container(
        height: screensize.height * 0.07,
        width: screensize.width,
        decoration: const BoxDecoration(color: tBlue),
        child: Slider(
            activeColor: tWhite,
            inactiveColor: Colors.transparent,
            thumbColor: tWhite,
            divisions: 2,
            min: 0,
            max: 2,
            label: Get.find<UserDataUploadMango>().sliderValueToStatus(slider),
            value: slider,
            onChanged: (newrating) {
              setState(() {
                slider = newrating;
              });

              Get.find<UserDataUploadMango>()
                  .updateIssueStatusByIndex(widget.index, newrating);
            }),
      ),
      appBar: AppBar(
        backgroundColor: tWhite,
        title: Text(
          'Detailed Page',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: tBlack,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: screensize.width * 0.95,
            height: screensize.height * 0.23,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.data['items'].length,
              itemBuilder: (ctx, i) {
                final itemData = widget.data['items'][i];
                return Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Container(
                    height: screensize.height * 0.23,
                    width: screensize.width * 0.3,
                    decoration: BoxDecoration(
                      color: tWhite,
                      // border: Border.all(color: tBlack.withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          itemData['images'].toString(),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: screensize.height * 0.615,
            width: screensize.width * 0.95,
            child: ListView.builder(
              itemCount: widget.data['items'].length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final itemData = widget.data['items'][index];
                return Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    itemData['productName'].toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 35,
                                      fontWeight: FontWeight.w700,
                                      color: tBlack,
                                    ),
                                  ),
                                  const Gap(10),
                                  Text(
                                    'x${itemData['quantity'].toString()}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: tBlack.withOpacity(0.6),
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(5),
                              Row(
                                children: [
                                  Text(
                                    itemData['Brandname'].toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: tBlack.withOpacity(0.5),
                                    ),
                                  ),
                                  const Gap(10),
                                  Text(
                                    itemData['Quantity'].toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: tBlack.withOpacity(0.6),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            '₹ ${itemData['price'].toString()}',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: tBlack.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                      Text(
                        itemData['Description'].toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: tBlack.withOpacity(0.6),
                        ),
                      ),
                      const Gap(20),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

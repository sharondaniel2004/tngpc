// ignore_for_file: sort_child_properties_last, deprecated_member_use, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tngpc/Modals/cartcontroller.dart';
import 'package:tngpc/constants/theme.dart';
import 'package:tngpc/user/components/usercart.dart';

class personalcareTabview extends StatelessWidget {
  final CartController cartController =
      Get.put(CartController()); // Ensure CartController is available

  personalcareTabview({Key? key}) : super(key: key);

  final List<Map<String, String>> personalcare = [
    {
      'id': '17',
      'title': 'Coca Cola',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvDTpnQIMV3gZSt-IpngoI9qOCpEal2nNcFw&usqp=CAU',
      'price': '55',
      'Brandname': 'achi',
      'Description': 'dnjksdnskjvb',
      'Quantity': '110ml'
    },
    {
      'id': '18',
      'title': 'Pepsi',
      'imageUrl': 'https://m.media-amazon.com/images/I/51-r9pOh08L.jpg',
      'price': '55',
      'Brandname': 'achi',
      'Description': 'dnjksdnskjvb',
      'Quantity': '110ml'
    },
    {
      'id': '19',
      'title': 'sprite',
      'imageUrl':
          'https://www.azhapasa.com/uploads/shops/products/banner/1613047864-dZjVimw3.jpg',
      'price': '55',
      'Brandname': 'achi',
      'Description': 'dnjksdnskjvb',
      'Quantity': '110ml'
    },
    {
      'id': '20',
      'title': 'maza',
      'imageUrl':
          'https://freshlist.in/image/cache/catalog/001-product-images/pepsi,ig,raw/mazza%20600ml-600x600.jpg',
      'price': '55',
      'Brandname': 'achi',
      'Description': 'dnjksdnskjvb',
      'Quantity': '110ml'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: tWhite,
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: personalcare.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (screenSize.width / screenSize.height * 1.8),
          crossAxisSpacing: 15,
          mainAxisSpacing: 18,
        ),
        itemBuilder: (ctx, i) => GestureDetector(
          onTap: () {
            cartController.addItem(
              personalcare[i]['id']!,
              personalcare[i]['title']!,
              personalcare[i]['imageUrl']!,
              double.parse(personalcare[i]
                  ['price']!), // Convert the price string to double
              personalcare[i]['Brandname']!,
              personalcare[i]['Description']!,
              personalcare[i]['Quantity']!,
            );
          },
          child: GridTile(
            child:
                Image.network(personalcare[i]['imageUrl']!, fit: BoxFit.cover),
            footer: GridTileBar(
              backgroundColor: tBlack.withOpacity(0.9),
              leading: Text(
                personalcare[i]['title']!,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: tWhite,
                ),
              ),
              title: Text(
                personalcare[i]['Brandname']!,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: tWhite,
                ),
              ),
              subtitle: Text(
                personalcare[i]['Description']!,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: tWhite,
                ),
              ),
              trailing: Text(
                personalcare[i]['Quantity']!,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: tWhite,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const CartScreen()),
        backgroundColor: tBlue,
        elevation: 0,
        child: SvgPicture.network(
          'https://www.svgrepo.com/show/533040/cart-minus.svg',
          height: 24,
          width: 24,
          color: tWhite,
        ),
      ),
    );
  }
}

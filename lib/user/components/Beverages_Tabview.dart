// ignore_for_file: sort_child_properties_last, deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tngpc/Modals/cartcontroller.dart';
import 'package:tngpc/constants/theme.dart';
import 'package:tngpc/user/components/usercart.dart';

class BeveragesTabview extends StatelessWidget {
  final CartController cartController = Get.put(CartController()); // Ensure CartController is available

  BeveragesTabview({Key? key}) : super(key: key);

  final List<Map<String, String>> beverages = [
    {
      'id': '1',
      'title': 'Coca Cola',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvDTpnQIMV3gZSt-IpngoI9qOCpEal2nNcFw&usqp=CAU',
      'price': '55',
      'Brandname': 'coco cola',
      'Description':
          'Beverages are any drinkable liquids, from refreshing water to energizing coffee, fulfilling a range of purposes from hydration to flavor enjoyment.',
      'Quantity': '110ml'
    },
    {
      'id': '2',
      'title': 'Pepsi',
      'imageUrl': 'https://m.media-amazon.com/images/I/51-r9pOh08L.jpg',
      'price': '55',
      'Brandname': 'coco cola',
      'Description':
          'Beverages are any drinkable liquids, from refreshing water to energizing coffee, fulfilling a range of purposes from hydration to flavor enjoyment.',
      'Quantity': '110ml'
    },
    {
      'id': '3',
      'title': 'sprite',
      'imageUrl':
          'https://www.azhapasa.com/uploads/shops/products/banner/1613047864-dZjVimw3.jpg',
      'price': '55',
      'Brandname': 'coco cola',
      'Description':
          'Beverages are any drinkable liquids, from refreshing water to energizing coffee, fulfilling a range of purposes from hydration to flavor enjoyment.',
      'Quantity': '110ml'
    },
    {
      'id': '4',
      'title': 'maza',
      'imageUrl':
          'https://freshlist.in/image/cache/catalog/001-product-images/pepsi,ig,raw/mazza%20600ml-600x600.jpg',
      'price': '55',
      'Brandname': 'coco cola',
      'Description':
          'Beverages are any drinkable liquids, from refreshing water to energizing coffee, fulfilling a range of purposes from hydration to flavor enjoyment.',
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
        itemCount: beverages.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (screenSize.width / screenSize.height * 1.8),
          crossAxisSpacing: 15,
          mainAxisSpacing: 18,
        ),
        itemBuilder: (ctx, i) => GestureDetector(
          onTap: () {
            cartController.addItem(
                beverages[i]['id']!,
                beverages[i]['title']!,
                beverages[i]['imageUrl']!,
                double.parse(beverages[i]
                    ['price']!), // Convert the price string to double
                beverages[i]['Brandname']!,
                beverages[i]['Description']!,
                beverages[i]['Quantity']!);
          },
          child: GridTile(
            child: Image.network(beverages[i]['imageUrl']!, fit: BoxFit.cover),
            footer: GridTileBar(
              backgroundColor: tBlack.withOpacity(0.9),
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    beverages[i]['title']!,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: tWhite,
                    ),
                  ),
                  const Gap(5),
                  Text(
                    beverages[i]['Brandname']!,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: tWhite,
                    ),
                  ),
                ],
              ),
              trailing: Text(
                '₹${beverages[i]['price']!}',
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

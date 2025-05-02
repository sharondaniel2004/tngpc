// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tngpc/Modals/cartcontroller.dart';
import 'package:tngpc/constants/theme.dart';
import 'package:tngpc/database/UserDataUpload.dart';
import 'package:uuid/uuid.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController cartController = Get.find<CartController>();
  UserDataUploadMango userDataUploadMango = Get.put(UserDataUploadMango());

  Future<void> submitData() async {
    try {
      // ignore: prefer_const_constructors
      final uuid = Uuid();
      List<Map<String, dynamic>> items = cartController.cartItems
          .map((element) => {
                'productName': element.title,
                'quantity': element.quantity,
                'images': element.imageUrl.toString(),
                'price': element.price,
                'Brandname': element.brandName,
                'Description': element.description,
                'Quantity': element.Quantity
              })
          .toList();
      final data = {
        '_id': uuid.v4(),
        'items': items,
      };
      await userDataUploadMango.pushData(data);
      cartController.clearCart();

      Get.snackbar(
        'Sucess',
        'Data was uploaded suceesfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: tGreen,
        colorText: tWhite,
      );
      Get.toNamed('userbottomnavbar');
    } catch (e) {
      Get.snackbar(
        'Failed',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: tREd,
        colorText: tWhite,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ScreenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Cart',
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: tBlack,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: ScreenSize.width,
        height: ScreenSize.height * 0.06,
        decoration: const BoxDecoration(color: tBlue),
        child: FloatingActionButton(
          onPressed: () => submitData(),
          backgroundColor: tBlue,
          elevation: 0,
          child: Text(
            'Order Now',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: tWhite,
            ),
          ),
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: cartController.cartItems.length,
          itemBuilder: (ctx, i) => ListTile(
            leading: Image.network(
              cartController.cartItems[i].imageUrl,
              width: 50,
              height: 50,
            ),
            // title: Text(
            //   cartController.cartItems[i].title,
            //   style: GoogleFonts.poppins(
            //     fontSize: 15,
            //     fontWeight: FontWeight.w600,
            //     color: tBlack,
            //   ),
            // ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'productName: ${cartController.cartItems[i].title}',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: tBlack,
                  ),
                ),
                Text(
                  'Quantity: ${cartController.cartItems[i].quantity}',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: tBlack,
                  ),
                ),
                Text(
                  'Price: ${cartController.cartItems[i].price}',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: tBlack,
                  ),
                ),
                Text(
                  'Brand: ${cartController.cartItems[i].brandName}',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: tBlack,
                  ),
                ),
                Text(
                  'Description: ${cartController.cartItems[i].description}',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: tBlack,
                  ),
                ),
                Text(
                  'Quantity: ${cartController.cartItems[i].Quantity}',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: tBlack,
                  ),
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.remove_shopping_cart),
              onPressed: () =>
                  cartController.removeItem(cartController.cartItems[i].id),
            ),
          ),
        ),
      ),
    );
  }
}

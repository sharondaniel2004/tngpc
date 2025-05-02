// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

class CartItem {
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final String description;
  final String brandName;
  final String Quantity;
  int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.brandName,
    required this.Quantity,
    this.quantity = 1,
  });
}

class CartController extends GetxController {
  var cartItems = List<CartItem>.empty(growable: true).obs;

  void addItem(String id, String title, String imageUrl, double price,
      String brandName, String description, String Quantity) {
    int index = cartItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      // Item exists, increase quantity
      cartItems[index].quantity++;
    } else {
      // Add new item
      cartItems.add(CartItem(
        id: id,
        title: title,
        imageUrl: imageUrl,
        price: price,
        brandName: brandName,
        description: description,
        Quantity: Quantity,
      ));
    }
    cartItems.refresh(); // Update the observable list to refresh UI
  }

  void removeItem(String id) {
    cartItems.removeWhere((item) => item.id == id);
    cartItems.refresh(); // Update the observable list to refresh UI
  }

  void clearCart() {
    cartItems.clear();
    cartItems.refresh(); // Update the observable list to refresh UI
  }
}

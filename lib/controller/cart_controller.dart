import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CartController extends GetxController {
  var cartItems = <Map<String, dynamic>>[].obs;
  double get totalAmount {
    double total = 0.0;
    for (var item in cartItems) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  @override
  void onInit() {
    super.onInit();
    _loadCartItems();
  }

  void addProductToCart(BuildContext context, String productId, String name,
      double price, String image, String weight) {
    var index = cartItems.indexWhere((item) => item['productId'] == productId);

    if (index != -1) {
      cartItems[index]['quantity'] = cartItems[index]['quantity'] + 1;
    } else {
      cartItems.add({
        'productId': productId,
        'name': name,
        'price': price,
        'image': image,
        'quantity': 1,
        'weight': weight,
      });
    }
    cartItems.refresh();
    _saveCartItems();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name added to cart!'),
      ),
    );
  }

  void removeProductFromCart(String productId) {
    cartItems.removeWhere((item) => item['productId'] == productId);
    cartItems.refresh();
    _saveCartItems();
  }

  void increaseQuantity(String productId) {
    var index = cartItems.indexWhere((item) => item['productId'] == productId);

    if (index != -1) {
      cartItems[index]['quantity'] = cartItems[index]['quantity'] + 1;
      cartItems.refresh();
      _saveCartItems();
    }
  }

  void decreaseQuantity(String productId) {
    var index = cartItems.indexWhere((item) => item['productId'] == productId);
    if (index != -1 && cartItems[index]['quantity'] > 1) {
      cartItems[index]['quantity']--;
      cartItems.refresh();
      _saveCartItems();
    }
  }

  void _saveCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartList = cartItems.map((item) => json.encode(item)).toList();
    prefs.setStringList('cartItems', cartList);
  }

  void _loadCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartList = prefs.getStringList('cartItems');
    if (cartList != null) {
      cartItems.value = cartList
          .map((item) => json.decode(item) as Map<String, dynamic>)
          .toList();
      cartItems.refresh();
    }
  }
}

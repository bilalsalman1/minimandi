// cart_util.dart

import 'package:flutter/material.dart';
import 'package:minimandi/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> addToCart(
    BuildContext context, Product product, int quantity) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> cartItems = prefs.getStringList('cartItems') ?? [];
  String cartItem =
      '${product.title}|$quantity|${product.amount * quantity}|${product.image}|${product.weight}';
  cartItems.add(cartItem);

  await prefs.setStringList('cartItems', cartItems);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('${product.title} added to cart!')),
  );
}

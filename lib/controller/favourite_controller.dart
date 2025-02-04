import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class FavoriteController extends GetxController {
  var favoriteProducts = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];

    favoriteProducts.value = favorites
        .map((item) => jsonDecode(item) as Map<String, dynamic>)
        .toList();
  }

  Future<void> toggleFavorite(
      Map<String, dynamic> product, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];

    String productJson = jsonEncode(product);
    String message;
    if (favorites.contains(productJson)) {
      favorites.remove(productJson);
      message = '${product['title']} removed from favorites!';
    } else {
      favorites.add(productJson);
      message = '${product['title']} added to favorites!';
    }

    await prefs.setStringList('favorites', favorites);
    _loadFavorites();

    // Show a SnackBar message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

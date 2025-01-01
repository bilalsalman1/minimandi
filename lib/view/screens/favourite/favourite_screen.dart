// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/models/product_model.dart';
import 'package:minimandi/view/widget/Custom_text_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteScreen extends StatefulWidget {
  final List<Product> products;
  const FavouriteScreen({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<String> favoriteItems = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favoriteItems = prefs.getStringList('favorites') ?? [];
    });
  }

  Future<void> _removeFromFavorites(String productJson) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];

    favorites.remove(productJson);

    await prefs.setStringList('favorites', favorites);

    setState(() {
      favoriteItems = favorites;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Product removed from favorites!'),
      ),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        elevation: 0,
        leading: null,
        backgroundColor: kSecondaryColor,
        title: CustomText(
          text: 'Favorites',
          textOverflow: TextOverflow.ellipsis,
          maxLines: 1,
          weight: FontWeight.bold,
          color: kPrimaryColor,
          textAlign: TextAlign.center,
          size: f(context, 23),
        ),
      ),
      body: favoriteItems.isEmpty
          ? Center(
              child: CustomText(
                text: 'No favorites added yet!',
                size: 18,
                color: kPrimaryColor,
                weight: FontWeight.bold,
              ),
            )
          : Padding(
              padding: only(context, top: 20, left: 20, right: 10),
              child: ListView.builder(
                itemCount: favoriteItems.length * 2,
                itemBuilder: (context, index) {
                  if (index.isOdd) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Divider(),
                    );
                  }

                  int itemIndex = index ~/ 2;
                  Map<String, dynamic> product =
                      jsonDecode(favoriteItems[itemIndex]);

                  return ListTile(
                    leading: product['image'] != null
                        ? Image.asset(
                            product['image'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : Icon(Icons.image_not_supported),
                    title: CustomText(
                      text: product['title'] ?? 'Unknown Product',
                      color: kPrimaryColor,
                      size: f(context, 16),
                      weight: FontWeight.bold,
                    ),
                    subtitle: CustomText(
                      text: '${product['weight'] ?? 'N/A'}',
                      color: kGreyColor,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText(
                          text: '\$${product['price'] ?? '0.00'}',
                          size: f(context, 16),
                          weight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: kPrimaryColor,
                            size: f(context, 20),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}

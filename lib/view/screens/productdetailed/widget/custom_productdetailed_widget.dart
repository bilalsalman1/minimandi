// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/models/product_model.dart';
import 'package:minimandi/view/screens/productdetailed/widget/review_widget.dart';
import 'package:minimandi/view/widget/Custom_Appbar_widget.dart';
import 'package:minimandi/view/widget/Custom_button_widget.dart';
import 'package:minimandi/view/widget/Custom_text_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ProductdetailedWidget extends StatefulWidget {
  final Product product;

  const ProductdetailedWidget({Key? key, required this.product})
      : super(key: key);

  @override
  State<ProductdetailedWidget> createState() => _ProductdetailedWidgetState();
}

class _ProductdetailedWidgetState extends State<ProductdetailedWidget> {
  int quantity = 1;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    String productJson = jsonEncode({
      'title': widget.product.title,
      'image': widget.product.image,
      'weight': widget.product.weight,
      'price': widget.product.amount,
    });
    setState(() {
      isFavorite = favorites.contains(productJson);
    });
  }

  Future<void> _toggleFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];

    String productJson = jsonEncode({
      'title': widget.product.title,
      'image': widget.product.image,
      'weight': widget.product.weight,
      'price': widget.product.amount,
    });

    if (favorites.contains(productJson)) {
      favorites.remove(productJson);
      setState(() {
        isFavorite = false;
      });
    } else {
      favorites.add(productJson);
      setState(() {
        isFavorite = true;
      });
    }

    await prefs.setStringList('favorites', favorites);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isFavorite
            ? '${widget.product.title} added to favorites!'
            : '${widget.product.title} removed from favorites!'),
      ),
    );
  }

  Future<void> _addToCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> cartItems = prefs.getStringList('cartItems') ?? [];
    String cartItem =
        '${widget.product.title}|$quantity|${widget.product.amount * quantity}|${widget.product.image}|${widget.product.weight}';
    cartItems.add(cartItem);

    await prefs.setStringList('cartItems', cartItems);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${widget.product.title} added to cart!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        icon: Icons.ios_share,
        background: kLightColor,
        text: '',
      ),
      backgroundColor: kSecondaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context, widget.product),
            _buildBody(context, widget.product),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, Product product) {
    return Container(
      width: w(context, double.infinity),
      height: h(context, 250),
      decoration: BoxDecoration(
        color: kLightColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        image: DecorationImage(
          image: AssetImage(product.image ?? 'assets/default_image.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: symmetric(context, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: product.title,
                    size: f(context, 24),
                    weight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border_sharp,
                      color: isFavorite ? Colors.red : kGreyColor,
                    ),
                    onPressed: _toggleFavorite,
                  ),
                ],
              ),
              CustomText(
                text: product.weight,
                size: f(context, 17),
                weight: FontWeight.w600,
                color: kGreyColor,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 45,
                        width: 45,
                        child: Card(
                          color: kSecondaryColor,
                          elevation: 2,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) quantity--;
                              });
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Color(0xff7c7c7c),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: w(context, 15),
                      ),
                      Center(
                        child: CustomText(
                          text: "$quantity",
                          size: f(context, 15),
                          color: kPrimaryColor,
                          weight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: w(context, 15),
                      ),
                      SizedBox(
                        height: 45,
                        width: 45,
                        child: Card(
                          color: kSecondaryColor,
                          elevation: 2,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            icon: Icon(
                              Icons.add,
                              color: kBlueColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomText(
                    text: '\$${(product.amount * quantity).toStringAsFixed(2)}',
                    size: f(context, 20),
                    color: kPrimaryColor,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(height: h(context, 10)),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Product Details',
                    size: f(context, 16),
                    color: kPrimaryColor,
                    weight: FontWeight.bold,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 35,
                  ),
                ],
              ),
              SizedBox(height: h(context, 2)),
              CustomText(
                text: product.description,
                textAlign: TextAlign.start,
                size: f(context, 12),
                color: Colors.grey,
                weight: FontWeight.bold,
              ),
              SizedBox(height: h(context, 8)),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: CustomText(
                      text: 'Nutritions',
                      size: f(context, 16),
                      color: kPrimaryColor,
                      weight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '100g',
                        style: TextStyle(
                          backgroundColor: Color(0xffEBEBEB),
                          fontSize: f(context, 9),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: kPrimaryColor,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: h(context, 8)),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: CustomText(
                      text: 'Reviews',
                      size: f(context, 16),
                      color: kPrimaryColor,
                      weight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RatingBarExample(),
                      SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: h(context, 30)),
        CustomButton(
          width: 400,
          height: 60,
          buttonText: 'Add to Cart',
          onTap: _addToCart,
          backgroundColor: kBlueColor,
          textSize: f(context, 18),
        ),
        SizedBox(
          height: h(context, 20),
        ),
      ],
    );
  }
}

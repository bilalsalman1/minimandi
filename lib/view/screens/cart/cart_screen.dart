// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/config/routes/routes.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/view/screens/cart/widget/custom_checkout_widget.dart';
import 'package:minimandi/view/widget/Custom_button_widget.dart';
import 'package:minimandi/view/widget/Custom_text_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<String> cartItems = [];
  double totalAmount = 0.0;

  @override
  void initState() {
    super.initState();
    _loadCartItems();
  }

  Future<void> _loadCartItems() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String>? savedCartItems = prefs.getStringList('cartItems');
      setState(() {
        cartItems = savedCartItems ?? [];
        _calculateTotalAmount();
      });
    } catch (e) {
      print("Error loading cart items: $e");
      setState(() {
        cartItems = [];
        totalAmount = 0.0;
      });
    }
  }

  void _removeItemFromCart(String title) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      cartItems.removeWhere((item) => item.startsWith(title));
    });
    await prefs.setStringList('cartItems', cartItems);
    _calculateTotalAmount();
  }

  void _updateQuantity(String title, int newQuantity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      final index = cartItems.indexWhere((item) => item.startsWith(title));
      if (index != -1) {
        final itemData = cartItems[index].split('|');
        cartItems[index] =
            '${itemData[0]}|$newQuantity|${itemData[2]}|${itemData[3]}|${itemData[4]}';
      }
    });
    await prefs.setStringList('cartItems', cartItems);
    _calculateTotalAmount();
  }

  void _calculateTotalAmount() {
    double total = 0.0;
    for (var item in cartItems) {
      final itemData = item.split('|');
      if (itemData.length == 5) {
        final int quantity = int.tryParse(itemData[1]) ?? 1;
        final double price = double.tryParse(itemData[2]) ?? 0.0;
        total += price * quantity;
      }
    }
    setState(() {
      totalAmount = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: kSecondaryColor,
        title: CustomText(
          text: 'My Cart',
          textOverflow: TextOverflow.ellipsis,
          maxLines: 1,
          weight: FontWeight.bold,
          color: kPrimaryColor,
          textAlign: TextAlign.center,
          size: f(context, 23),
        ),
      ),
      body: cartItems.isEmpty
          ? Center(
              child: CustomText(
                text: 'Your cart is empty!',
                size: f(context, 18),
                color: kPrimaryColor,
                weight: FontWeight.bold,
              ),
            )
          : ListView.builder(
              itemCount: cartItems.length * 2 - 1,
              itemBuilder: (context, index) {
                if (index.isOdd) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(color: kGreyColor, thickness: 0.5),
                  );
                }

                final itemIndex = index ~/ 2;
                final itemData = cartItems[itemIndex].split('|');

                if (itemData.length != 5) {
                  print('Invalid item data: ${cartItems[itemIndex]}');
                  return ListTile(
                    title: CustomText(
                      text: 'Invalid item data',
                      color: Colors.red,
                      size: f(context, 14),
                    ),
                  );
                }

                final String title = itemData[0];
                final int quantity = int.tryParse(itemData[1]) ?? 1;
                final double price = double.tryParse(itemData[2]) ?? 0.0;
                final String image = itemData[3];
                final String weight = itemData[4];
                return ListTile(
                  leading: Image.asset(image),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: title,
                            size: f(context, 16),
                            weight: FontWeight.bold,
                          ),
                          IconButton(
                            icon: const Icon(Icons.close, color: kGreyColor),
                            onPressed: () {
                              _removeItemFromCart(title);
                            },
                          ),
                        ],
                      ),
                      CustomText(
                        text: weight,
                        size: f(context, 14),
                        color: kGreyColor,
                      ),
                    ],
                  ),
                  subtitle: Row(
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
                                  if (quantity > 1) {
                                    _updateQuantity(title, quantity - 1);
                                  }
                                },
                                icon: Icon(
                                  Icons.remove,
                                  color: Color(0xff7c7c7c),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Center(
                            child: CustomText(
                              text: "$quantity",
                              size: f(context, 15),
                              color: kPrimaryColor,
                              weight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 15),
                          SizedBox(
                            height: 45,
                            width: 45,
                            child: Card(
                              color: kSecondaryColor,
                              elevation: 2,
                              child: IconButton(
                                onPressed: () {
                                  _updateQuantity(title, quantity + 1);
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
                        text: '\$${(price * quantity).toStringAsFixed(2)}',
                        size: f(context, 20),
                        color: kPrimaryColor,
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, top: 20),
        child: CustomButton(
          width: 400,
          height: 60,
          buttonText: 'Go to Checkout',
          onTap: () {
            _showBottomSheet(context, totalAmount);
          },
          backgroundColor: kBlueColor,
          textSize: f(context, 18),
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context, double totalAmount) {
  print(
      "Bottom sheet is being triggered with total amount: \$${totalAmount.toStringAsFixed(2)}");
  showModalBottomSheet(
    backgroundColor: kSecondaryColor,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (BuildContext context) {
      return SizedBox(
        height: h(context, double.infinity),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              CheckoutWidget(
                textColor: kPrimaryColor,
                subColor: Colors.grey,
                weight: FontWeight.bold,
                textSize: f(context, 20),
                text: 'Checkout',
                icon: Icons.close,
              ),
              CheckoutWidget(
                textColor: kGreyColor,
                subColor: kPrimaryColor,
                weight: FontWeight.bold,
                textSize: f(context, 15),
                text: 'Delivery',
                subText: 'Select Method',
                subSize: f(context, 15),
                icon: Icons.arrow_forward_ios,
              ),
              CheckoutWidget(
                textColor: kGreyColor,
                subColor: kPrimaryColor,
                weight: FontWeight.bold,
                textSize: f(context, 15),
                text: 'Payment',
                subText: 'Visa  **34',
                subSize: f(context, 15),
                icon: Icons.arrow_forward_ios,
              ),
              CheckoutWidget(
                textColor: kGreyColor,
                subColor: kPrimaryColor,
                weight: FontWeight.bold,
                textSize: f(context, 15),
                text: 'Promo Code',
                subText: 'Pick Discount',
                subSize: f(context, 15),
                icon: Icons.arrow_forward_ios,
              ),
              CheckoutWidget(
                textColor: kGreyColor,
                subColor: kPrimaryColor,
                weight: FontWeight.bold,
                textSize: f(context, 15),
                text: 'Total Cost',
                subText: '\$${totalAmount.toStringAsFixed(2)}',
                subSize: f(context, 20),
                icon: Icons.arrow_forward_ios,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'By Placing an order you agree to our',
                      color: kGreyColor,
                      size: f(context, 11),
                      weight: FontWeight.bold,
                    ),
                    CustomText(
                      text: 'Terms and Conditions.',
                      color: kPrimaryColor,
                      size: f(context, 11),
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: only(context, top: 20, bottom: 20),
                child: CustomButton(
                  width: 400,
                  height: 60,
                  buttonText: 'Place Order',
                  onTap: () {
                    Get.offAllNamed(AppLinks.accepted);
                  },
                  backgroundColor: kBlueColor,
                  textSize: f(context, 18),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/config/routes/routes.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/controller/cart_controller.dart';
import 'package:minimandi/view/screens/cart/widget/custom_checkout_widget.dart';
import 'package:minimandi/view/screens/cart/widget/custom_listtile_widget.dart';
import 'package:minimandi/view/widget/custom_button_widget.dart';
import 'package:minimandi/view/widget/custom_text_widget.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: kSecondaryColor,
        title: Center(
          child: CustomText(
            text: 'My Cart',
            weight: FontWeight.w500,
            color: kPrimaryColor,
            size: 20,
          ),
        ),
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return Center(
            child: CustomText(
              text: 'No items in the cart.',
              weight: FontWeight.w500,
              color: kPrimaryColor,
              size: 20,
            ),
          );
        } else {
          return ListView.builder(
            itemCount: cartController.cartItems.length,
            itemBuilder: (context, index) {
              var cartItem = cartController.cartItems[index];
              return Column(
                children: [
                  CustomListtileWidget(
                    image: cartItem['image'] ?? '',
                    title: cartItem['name'] ?? 'Unknown Item',
                    weight: cartItem['weight'] ?? 'Unknown',
                    quantity: cartItem['quantity']?.toString() ?? '1',
                    price: '\$${cartItem['price'] ?? 0.0}',
                    removeItem: () => cartController
                        .removeProductFromCart(cartItem['productId']),
                    onAdd: () =>
                        cartController.increaseQuantity(cartItem['productId']),
                    onRemove: () {
                      if (cartItem['quantity'] > 1) {
                        cartController.decreaseQuantity(cartItem['productId']);
                      }
                    },
                  ),
                  Padding(
                    padding: symmetric(context, horizontal: 20),
                    child: const Divider(thickness: 1),
                  ),
                ],
              );
            },
          );
        }
      }),
      bottomNavigationBar: Padding(
        padding: only(context, top: 20, bottom: 20),
        child: CustomButton(
          borderRadius: 20.0,
          width: 364,
          height: 67,
          fontWeight: FontWeight.w500,
          buttonText: 'Go to Checkout',
          onTap: () => _showBottomSheet(context, cartController.totalAmount),
          backgroundColor: kBlueColor,
          textSize: 18,
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, double totalAmount) {
    showModalBottomSheet(
      backgroundColor: kSecondaryColor,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              CheckoutWidget(
                textColor: kPrimaryColor,
                subColor: Colors.grey,
                weight: FontWeight.w500,
                textSize: 24,
                text: 'Checkout',
                icon: Icons.close,
              ),
              CheckoutWidget(
                textColor: kGreyColor,
                subColor: kPrimaryColor,
                weight: FontWeight.w500,
                textSize: f(context, 18),
                text: 'Delivery',
                subText: 'Select Method',
                subSize: f(context, 16),
                icon: Icons.arrow_forward_ios,
              ),
              CheckoutWidget(
                textColor: kGreyColor,
                subColor: kPrimaryColor,
                weight: FontWeight.w500,
                textSize: f(context, 18),
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
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'By placing an order, you agree to our',
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
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: CustomButton(
                  width: double.infinity,
                  height: 60,
                  buttonText: 'Place Order',
                  onTap: () => Get.offAllNamed(AppLinks.accepted),
                  backgroundColor: kBlueColor,
                  textSize: f(context, 18),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

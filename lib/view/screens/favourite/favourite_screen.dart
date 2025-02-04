import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/controller/favourite_controller.dart';
import 'package:minimandi/view/screens/favourite/widget/custom_listtile.dart';
import 'package:minimandi/view/widget/Custom_text_widget.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({
    Key? key,
  }) : super(key: key);

  final FavoriteController favoriteController = Get.put(FavoriteController());

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
            text: 'Favorites',
            weight: FontWeight.w500,
            color: kPrimaryColor,
            size: 20,
          ),
        ),
      ),
      body: Obx(() {
        if (favoriteController.favoriteProducts.isEmpty) {
          return Center(
            child: CustomText(
              text: "No favorites added!",
              weight: FontWeight.w500,
              color: kPrimaryColor,
              size: 20,
            ),
          );
        }
        return Padding(
          padding: only(context, top: 20, left: 20, right: 10),
          child: ListView.builder(
            itemCount: favoriteController.favoriteProducts.length,
            itemBuilder: (context, index) {
              var product = favoriteController.favoriteProducts[index];
              return Column(
                children: [
                  CustomListtile(
                    image: product['image'] ?? 'assets/default_image.png',
                    title: product['title'] ?? 'Unknown Product',
                    weight: product['weight'] ?? 'N/A',
                    price: '\$${product['amount'] ?? '0.00'}',
                    icon: Icons.arrow_forward_ios,
                  ),
                  Padding(
                    padding: symmetric(context, horizontal: 20),
                    child: const Divider(
                      thickness: 1,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      }),
    );
  }
}

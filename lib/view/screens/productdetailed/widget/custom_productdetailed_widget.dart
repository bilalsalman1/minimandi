// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/controller/cart_controller.dart';
import 'package:minimandi/controller/favourite_controller.dart';
import 'package:minimandi/models/product_model.dart';
import 'package:minimandi/view/screens/productdetailed/widget/review_widget.dart';
import 'package:minimandi/view/widget/Custom_Appbar_widget.dart';
import 'package:minimandi/view/widget/Custom_button_widget.dart';
import 'package:minimandi/view/widget/Custom_text_widget.dart';

class ProductdetailedWidget extends StatefulWidget {
  final Product product;

  const ProductdetailedWidget({Key? key, required this.product})
      : super(key: key);

  @override
  State<ProductdetailedWidget> createState() => _ProductdetailedWidgetState();
}

class _ProductdetailedWidgetState extends State<ProductdetailedWidget> {
  int quantity = 1;
  final CartController cartController = Get.find();
  final FavoriteController favoriteController = Get.find();
  final PageController _pageController = PageController();

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
      ),
      child: SizedBox(
        height: h(context, 199.18),
        width: w(context, 329.34),
        child: PageView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Image(
              image: AssetImage(
                product.image ?? 'assets/default_image.png',
              ),
              fit: BoxFit.contain,
            );
          },
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
              SizedBox(
                height: h(context, 17),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: product.title,
                    size: 24,
                    weight: FontWeight.w500,
                    color: kPrimaryColor,
                  ),
                  Obx(() {
                    bool isFavorite = favoriteController.favoriteProducts
                        .any((item) => item['id'] == product.id);

                    return IconButton(
                      icon: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border_sharp,
                        color: isFavorite ? Colors.red : kGreyColor,
                      ),
                      onPressed: () async {
                        await favoriteController.toggleFavorite({
                          'id': widget.product.id,
                          'title': widget.product.title,
                          'image': widget.product.image,
                          'amount': widget.product.amount,
                          'weight': widget.product.weight,
                        }, context);
                      },
                    );
                  }),
                ],
              ),
              CustomText(
                text: product.weight,
                size: 18,
                weight: FontWeight.w300,
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
                    size: 26,
                    color: kPrimaryColor,
                    weight: FontWeight.w600,
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
                    size: 18,
                    color: kPrimaryColor,
                    weight: FontWeight.w500,
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
                size: 14,
                color: Colors.grey,
                weight: FontWeight.w300,
              ),
              SizedBox(height: h(context, 8)),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: CustomText(
                      text: 'Nutritions',
                      size: 18,
                      color: kPrimaryColor,
                      weight: FontWeight.w500,
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
                      size: 18,
                      color: kPrimaryColor,
                      weight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RatingBarExample(),
                      SizedBox(width: w(context, 5)),
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
          borderRadius: 20.0,
          width: 364,
          height: 67,
          buttonText: 'Add to Cart',
          onTap: () {
            cartController.addProductToCart(
              context,
              product.id,
              product.title,
              product.amount,
              product.image ?? '',
              product.weight,
            );
          },
          backgroundColor: kBlueColor,
          fontWeight: FontWeight.w500,
          textSize: 18,
        ),
        SizedBox(
          height: h(context, 20),
        ),
      ],
    );
  }
}

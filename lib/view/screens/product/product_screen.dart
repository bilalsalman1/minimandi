// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_images.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/models/explore_model.dart';
import 'package:minimandi/models/product_model.dart';
import 'package:minimandi/view/screens/product/functions.dart';
import 'package:minimandi/view/screens/productdetailed/productdetailed_screen.dart';
import 'package:minimandi/view/widget/Custom_Appbar_widget.dart';
import 'package:minimandi/view/widget/Custom_text_widget.dart';
import 'package:minimandi/view/widget/common_image_view_widget.dart';

class ProductScreen extends StatefulWidget {
  final String title;
  final List<Product> products;
  final Category category;

  const ProductScreen({
    Key? key,
    required this.title,
    required this.products,
    required this.category,
  }) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: CustomAppBar2(
        iconAsset: Assets.filter,
        background: kSecondaryColor,
        text: widget.category.name,
      ),
      body: _buildBody(context, widget.products),
    );
  }

  Widget _buildBody(BuildContext context, List<Product> products) {
    return Padding(
      padding: all(context, 20),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 6,
          mainAxisSpacing: 8,
          childAspectRatio: 0.72,
        ),
        itemBuilder: (ctx, index) {
          return ProductCard(
            product: products[index],
            onSelect: () =>
                Get.to(() => ProductDetailedScreen(product: products[index])),
            addToCart: (quantity) =>
                addToCart(context, products[index], quantity),
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onSelect;
  final Function(int) addToCart;

  const ProductCard({
    Key? key,
    required this.product,
    required this.onSelect,
    required this.addToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: kGreyColor, width: 0.5),
          borderRadius: BorderRadius.circular(18),
        ),
        color: kSecondaryColor,
        child: Padding(
          padding: all(context, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h(context, 10)),
              Center(
                child: CommonImageView(
                  imagePath: product.image ?? 'assets/default_image.png',
                  height: h(context, 70),
                  width: w(context, 90),
                ),
              ),
              SizedBox(height: h(context, 15)),
              CustomText(
                text: product.title,
                color: kPrimaryColor,
                size: f(context, 15),
                weight: FontWeight.bold,
                maxLines: 2,
                textOverflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: h(context, 3)),
              CustomText(
                text: product.weight,
                textOverflow: TextOverflow.ellipsis,
                maxLines: 1,
                color: kGreyColor,
                size: f(context, 13),
                weight: FontWeight.normal,
              ),
              SizedBox(height: h(context, 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: '\$${product.amount.toString()}',
                    color: kPrimaryColor,
                    size: f(context, 17),
                    weight: FontWeight.bold,
                  ),
                  Center(
                    child: Container(
                      height: h(context, 40),
                      width: w(context, 40),
                      decoration: BoxDecoration(
                        color: kBlueColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            addToCart(1);
                          },
                          icon: Icon(
                            Icons.add,
                            color: kSecondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

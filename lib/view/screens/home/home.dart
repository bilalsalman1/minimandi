// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_images.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/controller/product_controller.dart';
import 'package:minimandi/models/product_model.dart';
import 'package:minimandi/view/screens/home/widget/custom_grocery_widget.dart';
import 'package:minimandi/view/screens/product/functions.dart';
import 'package:minimandi/view/screens/product/product_screen.dart';
import 'package:minimandi/view/screens/productdetailed/productdetailed_screen.dart';
import 'package:minimandi/view/widget/Custom_text_widget.dart';
import 'package:minimandi/view/widget/common_image_view_widget.dart';
import 'package:minimandi/view/widget/custom_search_bar_widget.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            _buildBody(context),
            _buildCategorySections(context, productController),
          ],
        ),
      ),
    );
  }
}

Widget _buildHeader(BuildContext context) {
  return Column(children: [
    SizedBox(
      height: h(context, 50),
    ),
    CommonImageView(
      imagePath: Assets.home1,
      height: h(context, 70.82),
      width: w(context, 105),
    ),
    SizedBox(
      height: h(context, 15),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.location_on,
          color: kBlueColor,
        ),
        SizedBox(
          width: w(context, 5),
        ),
        CustomText(
          text: 'Faiz Road, Lahore',
          weight: FontWeight.bold,
          color: kBlueColor,
          size: f(context, 15),
        ),
      ],
    ),
    CustomSearchBar2(
      icons: Icons.search,
      hintText: 'Search',
    ),
  ]);
}

Widget _buildBody(
  BuildContext context,
) {
  return Padding(
    padding: only(context, left: 20, right: 20, top: 15),
    child: CommonImageView(
      imagePath: Assets.banner,
      height: 100,
      width: double.infinity,
    ),
  );
}

Widget _buildCategoryHeader(String title, BuildContext context) {
  return Padding(
    padding: only(context, left: 20, right: 20, top: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: title,
          color: kBlackColor,
          size: f(context, 23),
          weight: FontWeight.w900,
        ),
        CustomText(
          text: 'See All',
          color: kBlueColor,
          size: f(context, 17),
          weight: FontWeight.bold,
        ),
      ],
    ),
  );
}

Widget _buildSearchResults(
    BuildContext context, ProductController productcontroller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomText(
        text: 'Search Results',
        color: kBlackColor,
        size: f(context, 23),
        weight: FontWeight.w900,
      ),
      SizedBox(height: h(context, 10)),
      if (productcontroller.filteredProducts.isEmpty)
        Center(
          child: Column(
            children: [
              Icon(
                Icons.search_off,
                color: kGreyColor,
                size: f(context, 60),
              ),
              SizedBox(height: h(context, 10)),
              CustomText(
                text: 'No Products Found',
                color: kGreyColor,
                size: f(context, 18),
                weight: FontWeight.bold,
              ),
            ],
          ),
        )
      else
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: productcontroller.filteredProducts.length,
          itemBuilder: (context, index) {
            final product = productcontroller.filteredProducts[index];
            return ProductCard(
              product: product,
              addToCart: (int) {},
              onSelect: () {},
            );
          },
        ),
    ],
  );
}

Widget _buildProducts(BuildContext context, String category,
    ProductController productController) {
  List<Product> products = productController.getProductsByCategory(category);

  return GridView.builder(
    padding: only(context, left: 20, right: 20),
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200,
      crossAxisSpacing: 6,
      mainAxisSpacing: 8,
      childAspectRatio: 0.72,
    ),
    itemCount: products.length,
    itemBuilder: (context, index) {
      final product = products[index];
      return ProductCard(
        product: products[index],
        onSelect: () =>
            Get.to(() => ProductDetailedScreen(product: products[index])),
        addToCart: (quantity) => addToCart(context, products[index], quantity),
      );
    },
  );
}

Widget _buildCategorySections(
    BuildContext context, ProductController productcontroller) {
  List<String> categories = ['Exclusive Offer', 'Best Selling', 'Groceries'];

  return Column(
    children: categories.map((category) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategoryHeader(category, context),
          SizedBox(height: h(context, 10)),
          if (category == 'Groceries') ...[
            groceryRow(context),
            SizedBox(height: h(context, 10)),
          ],
          _buildProducts(context, category, productcontroller),
          SizedBox(height: h(context, 10)),
        ],
      );
    }).toList(),
  );
}

Widget groceryRow(
  BuildContext context,
) {
  return SingleChildScrollView(
    child: Padding(
      padding: only(
        context,
        left: 20,
        right: 0,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: const Row(
          children: [
            CustomGroceryWidget(
              color: Color(0xffF8A44C),
              image: Assets.imagesPulses,
              title: 'Pulses',
            ),
            CustomGroceryWidget(
              color: Color(0xff53B175),
              image: Assets.imagesRice,
              title: 'Rice',
            ),
          ],
        ),
      ),
    ),
  );
}

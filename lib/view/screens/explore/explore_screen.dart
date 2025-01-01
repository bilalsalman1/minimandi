// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/controller/product_controller.dart';
import 'package:minimandi/models/explore_model.dart';
import 'package:minimandi/view/screens/explore/widget/explore_widget.dart';
import 'package:minimandi/view/screens/product/product_screen.dart';
import 'package:minimandi/view/widget/Custom_text_widget.dart';
import 'package:minimandi/view/widget/custom_search_bar_widget.dart';

final List<Category> categoriesData = [
  Category(
    backgroundColor: Color(0xff53B175).withOpacity(1.0),
    borderColor: Color(0xff53B175),
    id: 'a1',
    image: Image.asset('assets/images/vegetable.png'),
    name: 'Fresh Fruits\nand Vegetables',
  ),
  Category(
    backgroundColor: Color(0xffF8A44C),
    borderColor: Color(0xffF8A44C),
    id: 'b1',
    image: Image.asset('assets/images/oil.png'),
    name: 'Cooking Oil\n& Ghee',
  ),
  Category(
    backgroundColor: Color(0xffF7A593),
    id: 'c1',
    borderColor: Color(0xffF7A593),
    image: Image.asset('assets/images/fish.png'),
    name: 'Meat & Fish',
  ),
  Category(
    backgroundColor: Color(0xffD3B0E0),
    id: 'd1',
    borderColor: Color(0xffD3B0E0),
    image: Image.asset('assets/images/cake.png'),
    name: 'Bakery & Snacks',
  ),
  Category(
    backgroundColor: Color(0xffFDE598),
    borderColor: Color(0xffFDE598),
    id: 'e1',
    image: Image.asset('assets/images/dairy.png'),
    name: 'Dairy & Eggs',
  ),
  Category(
    backgroundColor: Color(0xffB7DFF5),
    borderColor: Color(0xffB7DFF5),
    id: 'f1',
    image: Image.asset('assets/images/beverages.png'),
    name: 'Beverages',
  ),
];

class ExploreScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  ExploreScreen({super.key});

  void onSelect(BuildContext context, Category category) {
    Get.to(
      ProductScreen(
        title: category.name,
        products: productController.productData
            .where(
                (product) => product.category?.contains(category.id) ?? false)
            .toList(),
        category: category,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Column(
        children: [
          _buildHeader(context),
          _buildBody(context, onSelect),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: h(context, 40),
        ),
        Center(
          child: CustomText(
            text: 'Find Products',
            color: kPrimaryColor,
            weight: FontWeight.bold,
            size: f(context, 23),
          ),
        ),
        CustomSearchBar2(
          icons: Icons.search,
          hintText: 'Search Store',
        ),
      ],
    );
  }

  Widget _buildBody(
      BuildContext context, void Function(BuildContext, Category) onSelect) {
    return Expanded(
      child: Padding(
        padding: only(context, left: 20, right: 20, bottom: 20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              crossAxisSpacing: 0,
              mainAxisSpacing: 5),
          itemCount: categoriesData.length,
          itemBuilder: (context, index) {
            final category = categoriesData[index];
            return ExploreWidget(
              category: category,
              onSelect: () {
                onSelect(context, category);
              },
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/models/product_model.dart';
import 'package:minimandi/view/screens/productdetailed/productdetailed_screen.dart';
import 'package:minimandi/view/widget/Custom_text_widget.dart';

class CustomListtile extends StatelessWidget {
  final Product? product; // List of products
  final String image;
  final String title;
  final String weight;
  final String price;
  final IconData icon;

  CustomListtile({
    Key? key,
    required this.icon,
    required this.image,
    required this.title,
    required this.weight,
    this.product,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        image,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: CustomText(
        text: title,
        color: kPrimaryColor,
        size: f(context, 16),
        weight: FontWeight.bold,
      ),
      subtitle: CustomText(
        text: weight,
        color: kGreyColor,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            text: price,
            size: f(context, 16),
            weight: FontWeight.bold,
            color: kPrimaryColor,
          ),
          InkWell(
            onTap: () {},
            child: Icon(
              icon,
              size: f(context, 20),
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

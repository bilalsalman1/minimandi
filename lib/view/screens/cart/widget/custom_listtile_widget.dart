// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/view/widget/Custom_text_widget.dart';

class CustomListtileWidget extends StatelessWidget {
  final String image;
  final String title;
  final String weight;
  final String quantity;
  final String price;
  final VoidCallback onRemove;
  final VoidCallback onAdd;
  final VoidCallback removeItem;
  const CustomListtileWidget({
    super.key,
    required this.image,
    required this.title,
    required this.weight,
    required this.quantity,
    required this.price,
    required this.onRemove,
    required this.onAdd,
    required this.removeItem,
  });

  @override
  Widget build(BuildContext context) {
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
                size: 16,
                weight: FontWeight.w500,
              ),
              IconButton(
                icon: const Icon(Icons.close, color: kGreyColor),
                onPressed: removeItem,
              ),
            ],
          ),
          CustomText(
            text: weight,
            size: 13,
            color: kGreyColor,
            weight: FontWeight.w300,
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
                    onPressed: onRemove,
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
                    onPressed: onAdd,
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
            text: price,
            size: 18,
            color: kPrimaryColor,
            weight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}

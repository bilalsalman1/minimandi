// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/models/explore_model.dart';
import 'package:minimandi/view/widget/Custom_text_widget.dart';

class CustomCardWidget extends StatelessWidget {
  final Category category;
  final void Function() onSelect;
  const CustomCardWidget(
      {super.key, required this.category, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: category.borderColor, width: 2),
          borderRadius: BorderRadius.circular(18),
        ),
        color: category.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: h(context, 20),
            ),
            Center(child: category.image),
            SizedBox(
              height: h(context, 15),
            ),
            CustomText(
              textAlign: TextAlign.center,
              text: category.name,
              color: kPrimaryColor,
              size: 16,
              weight: FontWeight.w500,
            ),
            SizedBox(
              height: h(context, 8),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/view/widget/Custom_text_widget.dart';

class CheckoutWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color subColor;
  final double textSize;
  final double? subSize;
  final FontWeight weight;
  final String? subText;
  final IconData icon;
  const CheckoutWidget(
      {super.key,
      required this.textColor,
      this.subSize,
      required this.subColor,
      required this.weight,
      required this.textSize,
      required this.text,
      this.subText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CustomText(
            text: text,
            size: textSize,
            weight: weight,
            color: textColor,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                text: subText,
                size: subSize,
                weight: weight,
                color: subColor,
              ),
              Icon(
                icon,
                size: 20,
                color: kPrimaryColor,
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}

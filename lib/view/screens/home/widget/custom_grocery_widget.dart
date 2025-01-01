import 'package:flutter/material.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_fonts.dart';
import 'package:minimandi/constants/app_styling.dart';

import '../../../widget/Custom_text_widget.dart';

class CustomGroceryWidget extends StatelessWidget {
  final String image;
  final Color color;
  final String title;
  const CustomGroceryWidget(
      {super.key,
      required this.color,
      required this.image,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: only(
        context,
        right: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(17)),
        height: h(context, 70),
        width: w(context, 200),
        child: Row(
          children: [
            SizedBox(
              width: w(context, 20),
            ),
            Image.asset(
              image,
              height: h(context, 60),
            ),
            SizedBox(
              width: w(context, 10),
            ),
            CustomText(
              text: title,
              color: kBlackColor,
              size: f(context, 16),
              weight: FontWeight.w900,
              fontFamily: AppFonts.Poppins,
            ),
          ],
        ),
      ),
    );
  }
}

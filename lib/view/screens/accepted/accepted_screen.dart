// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/config/routes/routes.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_images.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/view/widget/Custom_button_widget.dart';
import 'package:minimandi/view/widget/Custom_text_widget.dart';
import 'package:minimandi/view/widget/common_image_view_widget.dart';

class AcceptedScreen extends StatelessWidget {
  const AcceptedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(
        context,
      ),
    );
  }
}

Widget _buildBody(BuildContext context) {
  return Container(
    height: h(context, double.infinity),
    width: w(context, double.infinity),
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(Assets.imagesAccepted),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonImageView(
          imagePath: Assets.imagesAccepted2,
          height: h(context, 150),
          width: w(context, 200),
        ),
        SizedBox(
          height: h(context, 40),
        ),
        CustomText(
          text: 'Your order has been\naccepted',
          size: f(context, 22),
          color: kPrimaryColor,
          textAlign: TextAlign.center,
          weight: FontWeight.bold,
        ),
        SizedBox(
          height: h(context, 10),
        ),
        CustomText(
          text:
              'Your items has been placed and is on\nit’s way to being processed.',
          size: f(context, 12),
          color: kGreyColor,
          textAlign: TextAlign.center,
          weight: FontWeight.w500,
        ),
        SizedBox(
          height: h(context, 30),
        ),
        CustomButton2(
          fontWeight: FontWeight.bold,
          textSize: f(context, 15),
          text: 'Track Order',
          onTap: () {},
          textColor: kBlueColor,
          backgroundColor: kSecondaryColor,
          borderColor: kBlueColor,
        ),
        SizedBox(
          height: h(context, 10),
        ),
        CustomTextButtonWidget(
          onPressed: () {
            Get.offAllNamed(AppLinks.bottom);
          },
          text: 'Back to Home',
          color: kBlueColor,
          size: f(context, 15),
          weight: FontWeight.bold,
        ),
      ],
    ),
  );
}

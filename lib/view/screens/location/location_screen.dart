// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/config/routes/routes.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_images.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/view/widget/Custom_Textfield_widget.dart';
import 'package:minimandi/view/widget/Custom_button_widget.dart';
import 'package:minimandi/view/widget/Custom_text_widget.dart';
import 'package:minimandi/view/widget/common_image_view_widget.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: _buildBody(context),
    );
  }
}

Widget _buildBody(BuildContext context) {
  return Stack(
    children: [
      CommonImageView(
        imagePath: Assets.background,
        height: h(context, 250),
        width: w(context, double.infinity),
      ),
      Positioned.fill(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 10),
          child: Container(
            color: Colors.transparent,
          ),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: only(context, left: 20, top: 35, right: 30),
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios)),
          ),
          SizedBox(
            height: h(context, 20),
          ),
          Center(
            child: CommonImageView(
              imagePath: Assets.locator,
              height: h(context, 140),
              width: w(context, 220),
            ),
          ),
          SizedBox(
            height: h(context, 25),
          ),
          Center(
            child: CustomText(
              text: 'Select your location',
              color: kPrimaryColor,
              size: f(context, 20),
              weight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: h(context, 15),
          ),
          Center(
            child: CustomText(
              textAlign: TextAlign.center,
              text:
                  'Switch on your location to stay in tune with\nwhat’s happening in your area',
              color: kGreyColor,
              size: f(context, 13),
              weight: FontWeight.w300,
            ),
          ),
          SizedBox(
            height: h(context, 60),
          ),
          Padding(
            padding: only(context, left: 20, right: 30),
            child: CustomText(
              textAlign: TextAlign.center,
              text: 'Your Zone',
              color: kGreyColor,
              size: f(context, 13),
              weight: FontWeight.w300,
            ),
          ),
          Padding(
            padding: only(context, left: 20, right: 20),
            child: CustomTextField(keyboardType: TextInputType.streetAddress),
          ),
          SizedBox(
            height: h(context, 20),
          ),
          Padding(
            padding: only(
              context,
              left: 20,
            ),
            child: CustomText(
              textAlign: TextAlign.center,
              text: 'Your Area',
              color: kGreyColor,
              size: f(context, 13),
              weight: FontWeight.w300,
            ),
          ),
          Padding(
            padding: only(context, left: 20, right: 20),
            child: CustomTextField(
                hintText: 'Type your area',
                keyboardType: TextInputType.streetAddress),
          ),
          SizedBox(
            height: h(context, 100),
          ),
          CustomButton(
            width: 400,
            height: 60,
            buttonText: 'Submit',
            onTap: () {
              Get.toNamed(AppLinks.login);
            },
            backgroundColor: kBlueColor,
            textSize: f(context, 18),
          ),
        ],
      ),
    ],
  );
}

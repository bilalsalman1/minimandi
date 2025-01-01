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

class OnboardingScreens extends StatelessWidget {
  const OnboardingScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }
}

Widget _buildBody(BuildContext context) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
        gradient: LinearGradient(
      colors: const [kTertiaryColor, kSecondaryColor, kSecondaryColor],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    )),
    child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
              padding: only(context, top: h(context, 75)),
              child: CommonImageView(
                imagePath: Assets.groceriespackages,
                height: h(context, 400),
                width: h(context, double.infinity),
              )),
          CustomText(
              textAlign: TextAlign.center,
              text: 'Welcome \nto our store',
              color: kBlueColor,
              size: f(context, 35),
              weight: FontWeight.w800),
          SizedBox(height: h(context, 10)),
          CustomText(
              textAlign: TextAlign.center,
              text: 'Get your groceries in as fast as one hour.',
              color: kGreyColor,
              size: f(context, 12),
              weight: FontWeight.w300),
          SizedBox(
            height: h(context, 20),
          ),
          CustomButton(
            width: 400,
            height: 60,
            buttonText: 'Get Started',
            onTap: () {
              Get.offAllNamed(AppLinks.signIn);
            },
            backgroundColor: kBlueColor,
            textSize: f(context, 18),
          ),
        ],
      ),
    ),
  );
}

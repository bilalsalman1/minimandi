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
      ),
    ),
    child: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: only(context, top: 70),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CommonImageView(
                      imagePath: Assets.imagesGroceriesPackages,
                      fit: BoxFit.contain,
                      height: h(context, 510),
                      width: w(context, 430),
                    ),
                    Padding(
                      padding: only(context, top: 410),
                      child: Text(
                        'Welcome \nto our store',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          backgroundColor: kSecondaryColor.withOpacity(0.5),
                          fontSize: f(context, 36),
                          color: kBlueColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomText(
                textAlign: TextAlign.center,
                text: 'Get your groceries in as fast as one hour.',
                color: kGreyColor,
                size: 14,
                weight: FontWeight.w300,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: CustomButton(
            borderRadius: 20.0,
            width: double.infinity,
            height: 67,
            fontWeight: FontWeight.w500,
            buttonText: 'Get Started',
            onTap: () {
              Get.offAllNamed(AppLinks.signIn);
            },
            backgroundColor: kBlueColor,
            textSize: 18,
          ),
        ),
      ],
    ),
  );
}

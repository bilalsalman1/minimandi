// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'dart:ui';

import 'package:country_code_picker/country_code_picker.dart';
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

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSecondaryColor,
        body: _buildHeader(context),
        floatingActionButton: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: 10,
              right: 10,
              child: FloatingActionButton(
                shape: CircleBorder(),
                backgroundColor: kBlueColor,
                onPressed: () {
                  Get.toNamed(AppLinks.location);
                },
                child: Icon(Icons.arrow_forward_ios, color: kSecondaryColor),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 200,
              child: CustomTextButtonWidget(
                onPressed: () {},
                text: 'Resend code',
                textAlign: TextAlign.start,
                color: kBlueColor,
                size: f(context, 16),
                weight: FontWeight.w900,
              ),
            ),
          ],
        ));
  }
}

Widget _buildHeader(BuildContext context) {
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
      Padding(
        padding: only(context, left: 20, top: 35, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios)),
            SizedBox(
              height: h(context, 40),
            ),
            CustomText(
              text: 'Enter your 4 digit code',
              color: kPrimaryColor,
              size: f(context, 20),
              weight: FontWeight.bold,
            ),
            SizedBox(
              height: h(context, 25),
            ),
            CustomText(
              text: 'code',
              color: kGreyColor,
              size: f(context, 13),
              weight: FontWeight.w300,
            ),
            Row(
              children: [
                CountryCodePicker(
                  onChanged: (countryCode) => countryCode.dialCode,
                  initialSelection: 'PK',
                  favorite: const ['+92', 'PK'],
                  showCountryOnly: false,
                ),
                Expanded(
                    child: CustomTextField(
                  keyboardType: TextInputType.number,
                )),
              ],
            ),
          ],
        ),
      )
    ],
  );
}

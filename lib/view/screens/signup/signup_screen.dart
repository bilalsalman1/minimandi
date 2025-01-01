// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/config/routes/routes.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_fonts.dart';
import 'package:minimandi/constants/app_images.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/view/screens/bottomnavigation/bottomnavigation_screen.dart';
import 'package:minimandi/view/widget/Custom_Textfield_widget.dart';
import 'package:minimandi/view/widget/Custom_button_widget.dart';
import 'package:minimandi/view/widget/Custom_text_widget.dart';
import 'package:minimandi/view/widget/common_image_view_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: only(context, left: 20, top: 35, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  SizedBox(
                    height: h(context, 15),
                  ),
                  Center(
                    child: CommonImageView(
                      imagePath: Assets.logo1,
                      height: 150,
                      width: 150,
                    ),
                  ),
                  SizedBox(
                    height: h(context, 25),
                  ),
                  CustomText(
                    text: 'Sign Up',
                    color: kPrimaryColor,
                    size: f(context, 20),
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: h(context, 1),
                  ),
                  CustomText(
                    textAlign: TextAlign.center,
                    text: 'Enter your credentials to create an account',
                    color: kGreyColor,
                    size: f(context, 13),
                    weight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: h(context, 25),
                  ),
                  CustomText(
                    textAlign: TextAlign.center,
                    text: 'Username',
                    color: kGreyColor,
                    size: f(context, 13),
                    weight: FontWeight.w300,
                  ),
                  CustomTextField(keyboardType: TextInputType.emailAddress),
                  SizedBox(
                    height: h(context, 20),
                  ),
                  CustomText(
                    textAlign: TextAlign.center,
                    text: 'Email',
                    color: kGreyColor,
                    size: f(context, 13),
                    weight: FontWeight.w300,
                  ),
                  CustomTextField(keyboardType: TextInputType.emailAddress),
                  SizedBox(
                    height: h(context, 20),
                  ),
                  CustomText(
                    textAlign: TextAlign.center,
                    text: 'Password',
                    color: kGreyColor,
                    size: f(context, 13),
                    weight: FontWeight.w300,
                  ),
                  CustomTextField3(
                    hintText: '',
                    isIcon: true,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'By continuing you agree to our  ',
                            style: TextStyle(
                                color: kGreyColor,
                                fontSize: f(context, 13),
                                fontFamily: AppFonts.Poppins),
                          ),
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(
                                color: kBlueColor,
                                fontSize: f(context, 13),
                                fontFamily: AppFonts.Poppins),
                          ),
                          TextSpan(
                            text: ' and',
                            style: TextStyle(
                                color: kGreyColor,
                                fontSize: f(context, 13),
                                fontFamily: AppFonts.Poppins),
                          ),
                          TextSpan(
                            text: ' Privacy Policy.',
                            style: TextStyle(
                                color: kBlueColor,
                                fontSize: f(context, 13),
                                fontFamily: AppFonts.Poppins),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h(context, 15),
                  ),
                ],
              ),
            ),
            CustomButton(
              width: 400,
              height: 60,
              buttonText: 'Signup',
              onTap: () {
                Get.toNamed(AppLinks.bottom);

                Get.offAll(() => BottomNavigation());
              },
              backgroundColor: kBlueColor,
              textSize: f(context, 18),
            ),
            SizedBox(
              height: h(context, 6),
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account?',
                    style: TextStyle(
                        fontSize: f(context, 15),
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor,
                        fontFamily: AppFonts.Poppins),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Sign in',
                        style: TextStyle(
                            fontSize: f(context, 15),
                            fontWeight: FontWeight.w600,
                            color: kBlueColor,
                            fontFamily: AppFonts.Poppins),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

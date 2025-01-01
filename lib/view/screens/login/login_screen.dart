// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/config/routes/routes.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_fonts.dart';
import 'package:minimandi/constants/app_images.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/view/widget/Custom_Textfield_widget.dart';
import 'package:minimandi/view/widget/Custom_button_widget.dart';
import 'package:minimandi/view/widget/Custom_text_widget.dart';
import 'package:minimandi/view/widget/common_image_view_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                    imagePath: 'assets/images/login1.png',
                    height: 150,
                    width: 150,
                  ),
                ),
                SizedBox(
                  height: h(context, 25),
                ),
                CustomText(
                  text: 'Login',
                  color: kPrimaryColor,
                  size: f(context, 20),
                  weight: FontWeight.bold,
                ),
                SizedBox(
                  height: h(context, 1),
                ),
                CustomText(
                  textAlign: TextAlign.center,
                  text: 'Enter your email and password',
                  color: kGreyColor,
                  size: f(context, 13),
                  weight: FontWeight.w300,
                ),
                SizedBox(
                  height: h(context, 25),
                ),
                CustomText(
                  text: 'Email',
                  color: kGreyColor,
                  size: f(context, 13),
                  weight: FontWeight.normal,
                ),
                CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: h(context, 20),
                ),
                CustomText(
                  textAlign: TextAlign.center,
                  text: 'Password',
                  color: kGreyColor,
                  size: f(context, 13),
                  weight: FontWeight.normal,
                ),
                CustomTextField3(
                  hintText: '',
                  isIcon: true,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: CustomTextButtonWidget(
                    onPressed: () {
                      Get.toNamed(AppLinks.signUp);
                    },
                    text: 'Forgot Password?',
                    color: kBlueColor,
                    size: f(context, 13),
                    weight: FontWeight.bold,
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
            buttonText: 'Login',
            onTap: () {
              Get.toNamed(AppLinks.signUp);
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
                  text: 'Don\'t have an account? ',
                  style: TextStyle(
                      fontSize: f(context, 15),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                      fontFamily: AppFonts.Poppins),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign Up',
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
      )
    ],
  );
}

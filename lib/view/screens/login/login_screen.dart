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
  return SingleChildScrollView(
    child: Stack(
      children: [
        CommonImageView(
          imagePath: Assets.imagesBackground,
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
                    height: h(context, 45),
                  ),
                  Center(
                    child: CommonImageView(
                      imagePath: Assets.imagesLogin1,
                      height: 140.31,
                      width: 128,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: h(context, 20),
                  ),
                  CustomText(
                    text: 'Login',
                    color: kPrimaryColor,
                    size: 24,
                    weight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: h(context, 1),
                  ),
                  CustomText(
                    textAlign: TextAlign.center,
                    text: 'Enter your email and password',
                    color: kGreyColor,
                    size: 14,
                    weight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: h(context, 42),
                  ),
                  CustomText(
                    text: 'Email',
                    color: kGreyColor,
                    size: 14,
                    weight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: h(context, 6),
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
                    size: 14,
                    weight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: h(context, 6),
                  ),
                  CustomTextField3(
                    hintText: '',
                    isIcon: true,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CustomTextButtonWidget(
                      onPressed: () {},
                      text: 'Forgot Password?',
                      color: Color(0xff181725),
                      size: 15,
                      weight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: h(context, 25),
                  ),
                ],
              ),
            ),
            CustomButton(
              width: 364,
              height: 67,
              buttonText: 'Login',
              onTap: () {
                Get.toNamed(AppLinks.bottom);
              },
              fontWeight: FontWeight.w500,
              backgroundColor: kBlueColor,
              textSize: 18,
            ),
            SizedBox(
              height: h(context, 6),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Get.toNamed(AppLinks.signUp);
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: kPrimaryColor,
                        fontFamily: AppFonts.Poppins),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
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
    ),
  );
}

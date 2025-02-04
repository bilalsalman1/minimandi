// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/constants/app_images.dart';
import 'package:minimandi/view/widget/common_image_view_widget.dart';
import '../../../config/routes/routes.dart';
import '../../../constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenHandler();
  }

  void splashScreenHandler() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(AppLinks.onBoarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }
}

Widget _buildBody() {
  return Container(
    decoration: const BoxDecoration(
      color: kTertiaryColor,
    ),
    child: Center(
        child: CommonImageView(
      imagePath: Assets.imagesMainlogo,
      width: 150,
      height: 150,
    )),
  );
}

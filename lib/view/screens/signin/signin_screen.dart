// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api
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

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: _buildBody(context),
    );
  }
}

Widget _buildBody(
  BuildContext context,
) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonImageView(
          imagePath: Assets.signin,
          width: h(context, double.infinity),
          height: h(context, 380),
        ),
        Padding(
          padding: only(
            context,
            left: 20,
            top: 20,
          ),
          child: CustomText(
              text: 'Get your groceries \nwith Mini Mandi',
              color: kPrimaryColor,
              size: f(context, 20),
              weight: FontWeight.bold),
        ),
        SizedBox(
          height: h(context, 25),
        ),
        Padding(
          padding: only(context, left: 20, right: 20),
          child: Row(
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
        ),
        SizedBox(
          height: h(context, 8),
        ),
        Center(
          child: CustomText(
              text: 'Or',
              color: kGreyColor,
              size: f(context, 16),
              weight: FontWeight.bold),
        ),
        SizedBox(
          height: h(context, 10),
        ),
        CustomButton3(
          width: 400,
          height: 60,
          buttonText: 'Continue with Google',
          textSize: f(context, 18),
          onTap: () {
            Get.toNamed(AppLinks.number);
          },
          textColor: kSecondaryColor,
          backgroundColor: kBlueLightColor,
        ),
        SizedBox(
          height: h(context, 10),
        ),
        CustomButton3(
          width: 400,
          height: 60,
          buttonText: 'Continue with Apple',
          textSize: f(context, 18),
          onTap: () {
            Get.toNamed(AppLinks.number);
          },
          textColor: kSecondaryColor,
          backgroundColor: kPrimaryColor,
        ),
        SizedBox(
          height: h(context, 10),
        ),
      ],
    ),
  );
}

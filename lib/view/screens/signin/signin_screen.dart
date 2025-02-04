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
          imagePath: Assets.imagesSignin,
          width: h(context, 430),
          height: h(context, 422),
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
              size: 24,
              weight: FontWeight.w500),
        ),
        SizedBox(
          height: h(context, 6),
        ),
        Padding(
          padding: only(context, left: 5, right: 15),
          child: Row(
            children: [
              CountryCodePicker(
                onChanged: (countryCode) => countryCode.dialCode,
                initialSelection: 'PK',
                favorite: const ['+92', 'PK'],
                showCountryOnly: false,
              ),
              Expanded(
                  child: Padding(
                padding: only(context, right: 20),
                child: CustomTextField(
                  keyboardType: TextInputType.number,
                ),
              )),
            ],
          ),
        ),
        SizedBox(
          height: h(context, 15),
        ),
        Center(
          child: CustomText(
              text: 'Or',
              color: kGreyColor,
              size: 18,
              weight: FontWeight.normal),
        ),
        SizedBox(
          height: h(context, 15),
        ),
        CustomButton3(
          borderRadius: 20.0,
          imagePath: Assets.iconsGoogle,
          width: 364,
          height: 67,
          buttonText: 'Continue with Google',
          fontWeight: FontWeight.normal,
          textSize: 18,
          onTap: () {
            Get.toNamed(AppLinks.number);
          },
          textColor: kSecondaryColor,
          backgroundColor: kBlueLightColor,
        ),
        SizedBox(
          height: h(context, 13),
        ),
        CustomButton3(
          borderRadius: 20.0,
          imagePath: Assets.iconsApple,
          width: 364,
          height: 67,
          fontWeight: FontWeight.normal,
          buttonText: 'Continue with Apple',
          textSize: 18,
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

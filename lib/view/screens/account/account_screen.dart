// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_images.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/view/screens/account/widget/custom_account_widget.dart';
import 'package:minimandi/view/widget/Custom_button_widget.dart';
import 'package:minimandi/view/widget/Custom_text_widget.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

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
    child: Column(
      children: [
        SizedBox(
          height: h(context, 70),
        ),
        AccountWidget(),
        SizedBox(
          height: h(context, 20),
        ),
        AccountTile(
            icon: ImageIcon(
              AssetImage(Assets.iconsOrders),
              size: 22,
              color: kblueColor,
            ),
            ontap: () {},
            text: CustomText(
              text: 'Orders',
              weight: FontWeight.w500,
              color: kblueColor,
              size: 16,
            )),
        AccountTile(
            icon: ImageIcon(
              AssetImage(Assets.iconsDetails),
              size: 22,
              color: kblueColor,
            ),
            ontap: () {},
            text: CustomText(
              text: 'My Details',
              weight: FontWeight.w500,
              color: kblueColor,
              size: 16,
            )),
        AccountTile(
            icon: ImageIcon(
              AssetImage(Assets.iconsDelivery),
              size: 22,
              color: kblueColor,
            ),
            ontap: () {},
            text: CustomText(
              text: 'Delivery Address',
              weight: FontWeight.w500,
              color: kblueColor,
              size: 16,
            )),
        AccountTile(
            icon: ImageIcon(
              AssetImage(Assets.iconsPayment),
              size: 22,
              color: kblueColor,
            ),
            ontap: () {},
            text: CustomText(
              text: 'Payment Methods',
              weight: FontWeight.w500,
              color: kblueColor,
              size: 16,
            )),
        AccountTile(
            icon: ImageIcon(
              AssetImage(Assets.iconsPromo),
              size: 22,
              color: kblueColor,
            ),
            ontap: () {},
            text: CustomText(
              text: 'Promo Code',
              weight: FontWeight.w500,
              color: kblueColor,
              size: 16,
            )),
        AccountTile(
            icon: ImageIcon(
              AssetImage(Assets.iconsBell),
              size: 22,
              color: kblueColor,
            ),
            ontap: () {},
            text: CustomText(
              text: 'Notifecations',
              weight: FontWeight.w500,
              color: kblueColor,
              size: 16,
            )),
        AccountTile(
            icon: ImageIcon(
              AssetImage(Assets.iconsHelp),
              size: 22,
              color: kblueColor,
            ),
            ontap: () {},
            text: CustomText(
              text: 'Help',
              weight: FontWeight.w500,
              color: kblueColor,
              size: 16,
            )),
        AccountTile(
            icon: ImageIcon(
              AssetImage(Assets.iconsAbout),
              size: 22,
              color: kblueColor,
            ),
            ontap: () {},
            text: CustomText(
              text: 'About',
              weight: FontWeight.w500,
              color: kblueColor,
              size: 16,
            )),
        Divider(
          color: kGreyColor,
          thickness: 0.5,
          height: 0.5,
        ),
        SizedBox(
          height: h(context, 24),
        ),
        Padding(
          padding: only(context, bottom: 20),
          child: CustomButton2(
            height: 67,
            text: 'Logout',
            width: 364,
            textColor: kBlueColor,
            onTap: () {},
            borderColor: kBlueColor,
            backgroundColor: kSecondaryColor,
            icons: Icons.logout,
            iconColor: kAlertColor,
            iconSize: 20,
            textSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

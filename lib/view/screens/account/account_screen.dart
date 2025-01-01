// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/view/screens/account/widget/account_widget.dart';
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
  return Column(
    children: [
      SizedBox(
        height: h(context, 70),
      ),
      AccountWidget(),
      SizedBox(
        height: h(context, 20),
      ),
      AccountTile(
          icons: Icons.shopping_bag_outlined,
          ontap: () {},
          text: CustomText(
            text: 'Orders',
            weight: FontWeight.bold,
            color: kblueColor,
            size: f(context, 16),
          )),
      AccountTile(
          icons: Icons.shopping_bag_outlined,
          ontap: () {},
          text: CustomText(
            text: 'My Details',
            weight: FontWeight.bold,
            color: kblueColor,
            size: f(context, 16),
          )),
      AccountTile(
          icons: Icons.location_on_outlined,
          ontap: () {},
          text: CustomText(
            text: 'Delivery Address',
            weight: FontWeight.bold,
            color: kblueColor,
            size: f(context, 16),
          )),
      AccountTile(
          icons: Icons.payment_outlined,
          ontap: () {},
          text: CustomText(
            text: 'Payment Methods',
            weight: FontWeight.bold,
            color: kblueColor,
            size: f(context, 16),
          )),
      AccountTile(
          icons: Icons.payment_outlined,
          ontap: () {},
          text: CustomText(
            text: 'Promo Code',
            weight: FontWeight.bold,
            color: kblueColor,
            size: f(context, 16),
          )),
      AccountTile(
          icons: Icons.notification_important_outlined,
          ontap: () {},
          text: CustomText(
            text: 'Notifecations ',
            weight: FontWeight.bold,
            color: kblueColor,
            size: f(context, 16),
          )),
      AccountTile(
          icons: Icons.help_outline_rounded,
          ontap: () {},
          text: CustomText(
            text: 'Help',
            weight: FontWeight.bold,
            color: kblueColor,
            size: f(context, 16),
          )),
      AccountTile(
          icons: Icons.help_outline_rounded,
          ontap: () {},
          text: CustomText(
            text: 'About',
            weight: FontWeight.bold,
            color: kblueColor,
            size: f(context, 16),
          )),
      Divider(
        color: kGreyColor,
        thickness: 0.5,
        height: 0.5,
      ),
      SizedBox(
        height: h(context, 24),
      ),
      CustomButton2(
        text: 'Logout',
        textColor: kBlueColor,
        onTap: () {},
        borderColor: kBlueColor,
        backgroundColor: kSecondaryColor,
        icons: Icons.logout,
        iconColor: kAlertColor,
        iconSize: f(context, 17),
        textSize: f(context, 22),
        fontWeight: FontWeight.bold,
      ),
    ],
  );
}

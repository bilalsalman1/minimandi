import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/view/screens/filter/widget/custom_filter_widget.dart';
import 'package:minimandi/view/widget/Custom_text_widget.dart';

import '../../widget/Custom_button_widget.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  List<bool> isSelected = List.generate(8, (index) => false);

  List<String> optionTexts = [
    'Eggs',
    'Noodles and Pasta',
    'Chips and Crisps',
    'Fast Food',
    'Individual Collection',
    'Coca Cola',
    'Nirala Bakers',
    'Butt Sweets',
  ];

  void _onFilterChanged(bool? value, int index) {
    setState(() {
      isSelected[index] = value ?? false;
    });
  }

  Widget buildCheckboxSection(String heading, int startIndex, int endIndex) {
    return Padding(
      padding: symmetric(context, vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: heading,
            weight: FontWeight.w500,
            color: kPrimaryColor,
            size: 24,
          ),
          SizedBox(
            height: h(context, 10),
          ),
          Column(
            children: List.generate(endIndex - startIndex, (index) {
              int checkboxIndex = startIndex + index;
              return CustomFilterWidget(
                text: optionTexts[checkboxIndex],
                value: isSelected[checkboxIndex],
                onChanged: (value) => _onFilterChanged(value, checkboxIndex),
              );
            }),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Get.back();
          },
        ),
        iconTheme: const IconThemeData(color: kPrimaryColor),
        elevation: 0,
        backgroundColor: kSecondaryColor,
        title: Center(
          child: CustomText(
            text: 'Filter',
            weight: FontWeight.bold,
            color: kPrimaryColor,
            size: 23,
          ),
        ),
      ),
      body: Padding(
        padding: only(context, top: 30),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Color(0xffE2E2E2),
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildCheckboxSection('Categories', 0, 4),
                      buildCheckboxSection('Brand', 4, 8),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: only(context, bottom: 20, top: 10),
                child: Column(
                  children: [
                    CustomButton2(
                      borderRadius: 20.0,
                      width: 364,
                      height: 67,
                      fontWeight: FontWeight.bold,
                      textSize: 15,
                      text: 'Reset Settings',
                      onTap: () {},
                      textColor: kBlueColor,
                      backgroundColor: kSecondaryColor,
                      borderColor: kBlueColor,
                    ),
                    SizedBox(height: h(context, 13)),
                    CustomButton3(
                      borderRadius: 20.0,
                      width: 364,
                      height: 67,
                      buttonText: 'Apply Filters',
                      fontWeight: FontWeight.normal,
                      textSize: 18,
                      onTap: () {},
                      textColor: kSecondaryColor,
                      backgroundColor: kBlueColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

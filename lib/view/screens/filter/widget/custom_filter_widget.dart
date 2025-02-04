import 'package:flutter/material.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/view/widget/Custom_text_widget.dart';

class CustomFilterWidget extends StatelessWidget {
  final String text;
  final ValueChanged<bool?> onChanged;
  final bool value;

  const CustomFilterWidget({
    super.key,
    required this.onChanged,
    required this.text,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          activeColor: kBlueColor,
          value: value,
          onChanged: onChanged,
        ),
        CustomText(
          text: text,
          size: 16,
          weight: FontWeight.w400,
        )
      ],
    );
  }
}

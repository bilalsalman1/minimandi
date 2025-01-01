import 'package:flutter/material.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/view/widget/Custom_text_widget.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: kBlueColor,
        radius: 30,
      ),
      title: CustomText(
        text: 'User',
        color: kBlueColor,
        size: f(context, 18),
        weight: FontWeight.bold,
      ),
      subtitle: CustomText(
        text: 'example123@example.com',
        color: kGreyColor,
        size: f(context, 16),
        weight: FontWeight.w500,
      ),
      trailing: Icon(
        Icons.edit,
        size: f(context, 15),
        color: kTertiaryColor,
      ),
    );
  }
}

class AccountTile extends StatelessWidget {
  final IconData icons;
  final CustomText text;
  final VoidCallback ontap;

  const AccountTile({
    super.key,
    required this.icons,
    required this.ontap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(
          color: kGreyColor,
          thickness: 0.5,
          height: 0.5,
        ),
        InkWell(
          onTap: ontap,
          child: Padding(
            padding: symmetric(context, horizontal: 10),
            child: ListTile(
              contentPadding: all(context, 5),
              dense: true,
              leading: Icon(
                icons,
                size: f(context, 22),
                color: kblueColor,
              ),
              title: text,
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: f(context, 18),
                color: kblueColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

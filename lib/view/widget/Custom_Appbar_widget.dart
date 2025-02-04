import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/view/widget/Custom_text_widget.dart';

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final String? iconAsset; // Asset image
  final IconData? icon; // Icon data
  final Color? background;
  final bool isIconButton; // Flag for IconButton
  final VoidCallback? onActionPressed; // Callback for button press

  const CustomAppBar2({
    Key? key,
    this.iconAsset,
    this.icon,
    required this.background,
    required this.text,
    this.isIconButton = false,
    this.onActionPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
      iconTheme: const IconThemeData(color: kPrimaryColor),
      elevation: 0,
      backgroundColor: background,
      title: Center(
        child: CustomText(
          text: text,
          textOverflow: TextOverflow.ellipsis,
          maxLines: 1,
          weight: FontWeight.bold,
          color: kPrimaryColor,
          textAlign: TextAlign.center,
          size: 23,
        ),
      ),
      actions: [
        Padding(
          padding: only(context, right: 6),
          child: isIconButton
              ? IconButton(
                  onPressed: onActionPressed ?? () {},
                  icon: iconAsset != null
                      ? Image.asset(iconAsset!)
                      : Icon(icon ?? Icons.deblur),
                )
              : iconAsset != null
                  ? Image.asset(iconAsset!)
                  : Icon(icon ?? Icons.deblur),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

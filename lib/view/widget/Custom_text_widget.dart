// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_styling.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final String? fontFamily;
  final TextAlign? textAlign;
  final TextDecoration decoration;
  final FontWeight? weight;
  final TextOverflow? textOverflow;
  final Color? color;
  final Color? decorationColor;
  final FontStyle? fontStyle;
  final VoidCallback? onTap;

  final int? maxLines;
  final double? size;
  final double? lineHeight;
  final double? paddingTop;
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingBottom;
  final double? letterSpacing;

  CustomText({
    Key? key,
    this.text,
    this.size,
    this.lineHeight,
    this.maxLines = 100,
    this.decoration = TextDecoration.none,
    this.color,
    this.letterSpacing,
    this.weight = FontWeight.w400,
    this.textAlign,
    this.textOverflow,
    this.fontFamily,
    this.paddingTop = 0,
    this.paddingRight = 0,
    this.paddingLeft = 0,
    this.paddingBottom = 0,
    this.onTap,
    this.fontStyle,
    this.decorationColor = kPrimaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: only(
        context,
        top: paddingTop ?? 0,
        left: paddingLeft ?? 0,
        right: paddingRight ?? 0,
        bottom: paddingBottom ?? 0,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text ?? "",
          style: TextStyle(
            fontSize: f(context, size ?? 14),
            color: color ?? kPrimaryColor,
            fontWeight: weight,
            decoration: decoration,
            decorationColor: decorationColor,
            fontFamily: fontFamily != null
                ? fontFamily
                : GoogleFonts.poppins().fontFamily,
            height: lineHeight,
            fontStyle: fontStyle,
            letterSpacing: letterSpacing,
          ),
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: textOverflow,
        ),
      ),
    );
  }
}

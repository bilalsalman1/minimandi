// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:minimandi/constants/app_images.dart';
import '../../constants/app_colors.dart';
// import '../../constants/app_images.dart';
import '../../constants/app_styling.dart';
import 'Custom_text_widget.dart';
// import 'common_image_view_widget.dart';

class CustomTextField extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputType keyboardType;
  final bool isIcon;
  final ImageIcon? icon;
  final double? size;

  const CustomTextField({
    Key? key,
    this.onChanged,
    required this.keyboardType,
    this.controller,
    this.hintText,
    this.labelText,
    this.isIcon = true,
    this.icon,
    this.size,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w(context, 400),
      height: h(context, 48),

      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(h(context, 8)),
      //   border: Border.all(
      //     color: kPrimaryColor,
      //     width: w(context, 1),
      //   ),
      //   color: kSecondaryColor,
      // ),
      child: Padding(
        padding: only(
          context,
          left: 0,
          right: 0,
          top: widget.isIcon ? 0 : 6,
          bottom: widget.isIcon ? 0 : 6,
        ),
        child: TextField(
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          onChanged: widget.onChanged,
          style: TextStyle(
              color: kPrimaryColor,
              fontSize: f(context, widget.size ?? 18),
              fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kGreyColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kGreyColor),
            ),

            border: InputBorder.none,
            labelText: widget.labelText,
            labelStyle: TextStyle(
              color: kGreyColor,
              fontSize: 13,
              fontWeight: FontWeight.w300,
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
                color: kPrimaryColor.withOpacity(0.5),
                fontSize: f(context, widget.size ?? 18),
                fontWeight: FontWeight.w400),
            // suffixIcon: widget.isIcon
            //     ? Padding(
            //         padding: all(context, 12),
            //         child: ImageIcon(AssetImage(Assets.iconsShop)),
            //       )
            //     : null,
            suffixIcon: widget.isIcon
                ? Padding(
                    padding: only(context, left: 12, bottom: 12),
                    child: widget.icon,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

class CustomTextField2 extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String hintText;
  final bool isIcon;

  const CustomTextField2({
    Key? key,
    this.onChanged,
    this.controller,
    required this.hintText,
    this.isIcon = false,
  }) : super(key: key);

  @override
  _CustomTextField2State createState() => _CustomTextField2State();
}

class _CustomTextField2State extends State<CustomTextField2> {
  bool _isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w(context, 400),
      height: h(context, 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(h(context, 8)),
        border: Border.all(
          color: kborderColor,
          width: w(context, 1),
        ),
        color: Color(0xffF6F6F6),
      ),
      child: Padding(
        padding: only(
          context,
          left: 0,
          top: widget.isIcon ? 2 : 0,
        ),
        child: TextField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          obscureText: widget.isIcon ? _isObscure : false,
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: f(context, 15),
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Color(0xffBDBDBD),
              fontSize: f(context, 15),
              fontWeight: FontWeight.w500,
            ),
            suffixIcon: widget.isIcon
                ? Padding(
                    padding: only(context, top: 12, right: 16),
                    child: CustomText(
                      text: _isObscure ? "Show" : 'Hide',
                      size: 16,
                      color: kTertiaryColor,
                      weight: FontWeight.w500,
                      onTap: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

class CustomTextField3 extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String hintText;
  final bool isIcon;
  final int maxLines;
  final double? size;
  const CustomTextField3(
      {Key? key,
      this.onChanged,
      this.controller,
      required this.hintText,
      this.isIcon = false,
      this.size,
      this.maxLines = 1})
      : super(key: key);

  @override
  State<CustomTextField3> createState() => _CustomTextField3State();
}

class _CustomTextField3State extends State<CustomTextField3> {
  bool _isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: w(context, double.maxFinite),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(h(context, 8)),
      //   border: Border.all(
      //     color: kborderColor,
      //     width: w(context, 1),
      //   ),
      //   color: Color(0xffF6F6F6),
      // ),
      child: Padding(
        padding: only(
          context,
          left: 0,
          top: widget.isIcon ? 6 : 0,
          bottom: widget.isIcon ? 6 : 0,
        ),
        child: TextField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          obscureText: widget.isIcon ? _isObscure : false,
          maxLines: widget.maxLines,
          style: TextStyle(
              color: kPrimaryColor,
              fontSize: f(context, widget.size ?? 18),
              fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kGreyColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kGreyColor),
            ),
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: TextStyle(
                color: Color(0xffBDBDBD),
                fontSize: f(context, widget.size ?? 18),
                fontWeight: FontWeight.w400),
            suffixIcon: widget.isIcon
                ? IconButton(
                    icon: _isObscure
                        ? ImageIcon(
                            AssetImage(Assets.iconsEye),
                            color: kGreyColor,
                          )
                        : Icon(
                            Icons.visibility_outlined,
                            color: kGreyColor,
                          ),
                    iconSize: 18,
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

class CustomCalenderTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String hintText;
  final String labelText;

  const CustomCalenderTextField({
    Key? key,
    this.onChanged,
    required this.labelText,
    this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w(context, 400),
      height: h(context, 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(h(context, 8)),
        border: Border.all(
          color: kborderColor,
          width: w(context, 1),
        ),
        color: Color(0xffF6F6F6),
      ),
      child: Padding(
        padding: only(
          context,
          left: 10,
          top: 3,
        ),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: f(context, 15),
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            labelText: labelText,
            hintStyle: TextStyle(
              color: Color(0xffBDBDBD),
              fontSize: f(context, 15),
              fontWeight: FontWeight.w500,
            ),
            suffixIcon: Padding(
              padding: all(context, 15),
              // child: CommonImageView(
              //   imagePath: Assets.imagesCalendericon,
              //   fit: BoxFit.contain,
              //   width: 20,
              //   height: 20,
              // ),
            ),
          ),
        ),
      ),
    );
  }
}

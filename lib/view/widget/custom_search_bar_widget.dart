import 'package:flutter/material.dart';
import 'package:minimandi/constants/app_colors.dart';
// import '../../constants/app_images.dart';
import '../../constants/app_styling.dart';
// import 'common_image_view_widget.dart';

class CustomSearchBar extends StatelessWidget {
  final double width;
  final String hintText;

  const CustomSearchBar({
    Key? key,
    this.width = double.infinity,
    this.hintText = 'Search',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w(context, width),
      decoration: BoxDecoration(
        color: const Color(0xffF0F2F3),
        borderRadius: BorderRadius.circular(h(context, 12)),
      ),
      child: Padding(
        padding: symmetric(
          context,
          horizontal: 14,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CommonImageView(
            //   imagePath: Assets.imagesSearch,
            //   fit: BoxFit.contain,
            //   height: h(context, 20),
            //   width: w(context, 20),
            // ),
            SizedBox(
              width: w(context, 10),
            ),
            Expanded(
              child: Center(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    hintStyle: const TextStyle(
                      color: Color(0xff9D9D9D),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchBar2 extends StatelessWidget {
  final double width;
  final String hintText;
  final IconData icons;
  final Function(String)? onSubmitted;
  const CustomSearchBar2({
    required this.icons,
    Key? key,
    this.onSubmitted,
    this.width = double.infinity,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: only(
        context,
        left: 20,
        right: 20,
        top: 20,
      ),
      width: w(context, width),
      decoration: BoxDecoration(
        color: const Color(0xffF0F2F3),
        borderRadius: BorderRadius.circular(h(context, 12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // CommonImageView(
          //   imagePath: Assets.imagesSearch,
          //   fit: BoxFit.contain,
          //   height: h(context, 20),
          //   width: w(context, 20),
          // ),
          // SizedBox(
          //   width: w(context, 10),
          // ),
          Expanded(
            child: Center(
              child: TextFormField(
                onFieldSubmitted: onSubmitted,
                decoration: InputDecoration(
                  contentPadding: all(context, 20),
                  prefixIcon: Icon(
                    icons,
                    color: kPrimaryColor,
                    size: 30,
                  ),
                  hintText: hintText,
                  border: InputBorder.none,
                  hintStyle: const TextStyle(
                    color: Color(0xff9D9D9D),
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

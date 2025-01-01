// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../constants/app_images.dart';
// import '../../constants/app_styling.dart';
// import '../screens/chat/chat_view.dart';
// import 'Custom_text_widget.dart';
// import 'common_image_view_widget.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String name;

//   const CustomAppBar({
//     required this.name,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       automaticallyImplyLeading: false,
//       backgroundColor: const Color(0xffF5F5F5),
//       title: Row(
//         children: [
//           CommonImageView(
//             imagePath: Assets.imagesMenuicon,
//             fit: BoxFit.contain,
//             width: 25,
//             height: 19,
//           ),
//           SizedBox(
//             width: w(context, 14),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomText(
//                 text: "Welcome Back!",
//                 size: 14,
//                 weight: FontWeight.w300,
//               ),
//               CustomText(
//                 text: name,
//                 size: 14,
//                 weight: FontWeight.w500,
//               ),
//             ],
//           ),
//           const Spacer(),
//           CommonImageView(
//             imagePath: Assets.imagesKing,
//             fit: BoxFit.contain,
//             width: 36,
//             height: 136,
//           ),
//           SizedBox(
//             width: w(context, 6),
//           ),
//           CommonImageView(
//             imagePath: Assets.imagesBell,
//             fit: BoxFit.contain,
//             width: 36,
//             height: 136,
//           ),
//           SizedBox(
//             width: w(context, 6),
//           ),
//           GestureDetector(
//             onTap: () {
//               Get.to(() => const ChatView());
//             },
//             child: CommonImageView(
//               imagePath: Assets.imagesMsg,
//               fit: BoxFit.contain,
//               width: 36,
//               height: 136,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/view/widget/Custom_text_widget.dart';

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final String? iconAsset; // String to hold the asset icon path
  final IconData? icon; // IconData for Flutter default icons
  final Color? background;

  const CustomAppBar2({
    Key? key,
    this.iconAsset, // Optional asset path
    this.icon, // Optional Flutter default icon
    required this.background,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios)),
      iconTheme: const IconThemeData(color: kPrimaryColor),
      elevation: 0,
      backgroundColor: background,
      title: CustomText(
        text: text,
        textOverflow: TextOverflow.ellipsis,
        maxLines: 1,
        weight: FontWeight.bold,
        color: kPrimaryColor,
        textAlign: TextAlign.center,
        size: 23,
      ),
      actions: [
        Padding(
          padding: only(context, right: 6),
          child: IconButton(
            onPressed: () {},
            icon: iconAsset != null
                ? Image.asset(iconAsset!) // Using asset icon if provided
                : icon != null
                    ? Icon(icon) // Using Flutter default icon if provided
                    : Icon(Icons.deblur), // Default icon if neither is provided
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_images.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/view/screens/account/account_screen.dart';
import 'package:minimandi/view/screens/cart/cart_screen.dart';
import 'package:minimandi/view/screens/favourite/favourite_screen.dart';
import 'package:minimandi/view/screens/home/home.dart';

import '../explore/explore_screen.dart';

class BottomNavigation extends StatefulWidget {
  final int initialIndex;

  const BottomNavigation({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late int currentindex;

  @override
  void initState() {
    super.initState();
    currentindex = widget.initialIndex;
  }

  final screen = [
    Home(),
    ExploreScreen(),
    CartScreen(),
    FavouriteScreen(),
    const AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: screen,
        index: currentindex,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: kSecondaryColor,
                selectedItemColor: kBlueColor,
                unselectedItemColor: kGreyColor,
                onTap: (index) {
                  setState(() {
                    currentindex = index;
                  });
                },
                currentIndex: currentindex,
                items: const [
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage(Assets.iconsShop)),
                      label: "Shop"),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage(Assets.iconsExplore)),
                      label: "Explore"),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage(Assets.iconsCart)),
                      label: "Cart"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_border_outlined),
                      label: "Favourite"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_2_outlined), label: "Account"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:get/get.dart';
import 'package:minimandi/controller/cart_controller.dart';
import 'package:minimandi/controller/favourite_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
    Get.put(FavoriteController());
  }
}

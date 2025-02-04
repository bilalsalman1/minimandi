import 'package:get/get.dart';
import 'package:minimandi/constants/app_images.dart';

import '../models/product_model.dart';

class ProductController extends GetxController {
  final List<Product> productData = [
    Product(
        weight: '1kg, Red',
        image: Assets.imagesApple,
        title: 'Apple',
        amount: 4.9,
        category: 'a1',
        id: 'a1',
        description: 'good'),
    Product(
        weight: '12pcs, Organic',
        image: Assets.imagesBanana,
        title: 'Banana',
        amount: 2.6,
        category: 'a1',
        id: 'a2',
        description: 'good'),
    Product(
        weight: '1kg, Shimla',
        image: Assets.imagesRedMirch,
        title: 'Red Mirch',
        amount: 3.0,
        category: 'a1',
        id: 'a3',
        description: 'good'),
    Product(
        weight: '250gm, Organic',
        image: Assets.imagesGinger,
        title: 'Ginger',
        amount: 1.06,
        category: 'a1',
        id: 'a4',
        description: 'good'),
    Product(
        weight: '1kg, Fresh',
        image: Assets.imagesBeefBone,
        title: 'Beef Bone',
        amount: 2.1,
        category: 'c1',
        id: 'c1',
        description: 'good'),
    Product(
        weight: '1kg, Broiler',
        image: Assets.imagesChicken,
        title: 'Chicken',
        amount: 2.9,
        category: 'c1',
        id: 'c2',
        description: 'good'),
    Product(
        weight: '30gm, Flavoured',
        image: Assets.imagesEggPasta,
        title: 'Egg Pasta',
        amount: 4.35,
        category: 'd1',
        id: 'd2',
        description: 'good'),
    Product(
        weight: '50gm, Flavoured',
        image: Assets.imagesEggNoodles,
        title: 'Egg Noodles',
        amount: 7.49,
        category: 'd1',
        id: 'd2',
        description: 'good'),
    Product(
        weight: '50gm, Added Flavour',
        image: Assets.imagesEggNoodles2,
        title: 'Egg Noodles',
        amount: 1.39,
        category: 'd1',
        id: 'd3',
        description: 'good'),
    Product(
        weight: '4pcs, Organic',
        image: Assets.imagesEggsChickenRed,
        title: 'Eggs Chicken Red',
        amount: 1.99,
        category: 'e1',
        id: 'e1',
        description: 'good'),
    Product(
        weight: '4pcs, Farmed',
        image: Assets.imagesLayersWhiteegg,
        title: 'Layers White egg',
        amount: 1.79,
        category: 'e1',
        id: 'e2',
        description: 'good'),
    Product(
        weight: '335ml,Diet',
        image: Assets.imagesCoke,
        title: 'Coke',
        amount: 1.99,
        category: 'f1',
        id: 'f1',
        description: 'good'),
    Product(
        weight: '330gm, Flavoured',
        image: Assets.imagesSprite,
        title: 'Sprite',
        amount: 1.79,
        category: 'f1',
        id: 'f2',
        description: 'good'),
    Product(
        weight: '2L, Fresh',
        image: Assets.imagesAppleJuice,
        title: 'Apple Juice',
        amount: 15.59,
        category: 'f1',
        id: 'f3',
        description: 'good'),
    Product(
        weight: '2L, Fresh',
        image: Assets.imagesOrangeJuice,
        title: 'Orange Juice',
        amount: 13.49,
        category: 'f1',
        id: 'f4',
        description: 'good'),
    Product(
        weight: '250ml, Flavoured',
        image: Assets.imagesPepsi,
        title: 'Pepsi',
        amount: 1.69,
        category: 'f1',
        id: 'f5',
        description: 'good'),
    Product(
        weight: '250ml, Origonal',
        image: Assets.imagesCocaCola,
        title: 'Coca Cola',
        amount: 1.69,
        category: 'f1',
        id: 'f6',
        description: 'good'),
    Product(
        weight: '1kg, Red',
        image: Assets.imagesApple,
        title: 'Apple',
        amount: 4.9,
        category: 'Exclusive Offer',
        id: 'a1',
        description: 'good'),
    Product(
        weight: '12pcs, Organic',
        image: Assets.imagesBanana,
        title: 'Banana',
        amount: 2.6,
        category: 'Exclusive Offer',
        id: 'a2',
        description: 'good'),
    Product(
        weight: '1kg, Shimla',
        image: Assets.imagesRedMirch,
        title: 'Red Mirch',
        amount: 3.0,
        category: 'Best Selling',
        id: 'a3',
        description: 'good'),
    Product(
        weight: '250gm, Organic',
        image: Assets.imagesGinger,
        title: 'Ginger',
        amount: 1.06,
        category: 'Best Selling',
        id: 'a4',
        description: 'good'),
    Product(
        weight: '1kg, Fresh',
        image: Assets.imagesBeefBone,
        title: 'Beef Bone',
        amount: 2.1,
        category: 'Groceries',
        id: 'c1',
        description: 'good'),
    Product(
        weight: '1kg, Broiler',
        image: Assets.imagesChicken,
        title: 'Chicken',
        amount: 2.9,
        category: 'Groceries',
        id: 'c2',
        description: 'good'),
  ];
  List<Product> getProductsByCategory(String category) {
    return productData
        .where((product) => product.category == category)
        .toList();
  }

  var filteredProducts = <Product>[];

  void filterByCategory(String category) {
    filteredProducts = getProductsByCategory(category);
  }
}

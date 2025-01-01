// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:minimandi/models/product_model.dart';
import 'package:minimandi/view/screens/productdetailed/widget/custom_productdetailed_widget.dart';

class ProductDetailedScreen extends StatelessWidget {
  final Product product;

  ProductDetailedScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProductdetailedWidget(product: product));
  }
}

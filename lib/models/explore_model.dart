import 'package:flutter/material.dart';

class Category {
  final Image? image;
  final String name;
  final Color backgroundColor;
  final Color borderColor;
  final String id;

  Category({
    required this.name,
    required this.backgroundColor,
    required this.borderColor,
    this.image,
    required this.id,
  }) {
    assert(name.isNotEmpty, 'Name should not be empty');
    assert(id.isNotEmpty, 'ID should not be empty');
  }
}

// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 5,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 17,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Color(0xffF3603F),
      ),
      onRatingUpdate: (rating) {
        print('Rating is: $rating');
      },
    );
  }
}

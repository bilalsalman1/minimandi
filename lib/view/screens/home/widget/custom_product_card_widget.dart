import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styling.dart';
import '../../../../models/product_model.dart';
import '../../../widget/Custom_text_widget.dart';
import '../../../widget/common_image_view_widget.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onSelect;
  final Function(int) addToCart;

  const ProductCard({
    Key? key,
    required this.product,
    required this.onSelect,
    required this.addToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: kGreyColor, width: 0.5),
          borderRadius: BorderRadius.circular(18),
        ),
        color: kSecondaryColor,
        child: Padding(
          padding: all(context, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h(context, 10)),
              Center(
                child: CommonImageView(
                  imagePath: product.image ?? 'assets/default_image.png',
                  height: h(context, 70),
                  width: w(context, 90),
                ),
              ),
              SizedBox(height: h(context, 15)),
              CustomText(
                text: product.title,
                color: kPrimaryColor,
                size: f(context, 15),
                weight: FontWeight.bold,
                maxLines: 2,
                textOverflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: h(context, 3)),
              CustomText(
                text: product.weight,
                textOverflow: TextOverflow.ellipsis,
                maxLines: 1,
                color: kGreyColor,
                size: f(context, 13),
                weight: FontWeight.normal,
              ),
              SizedBox(height: h(context, 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: '\$${product.amount.toString()}',
                    color: kPrimaryColor,
                    size: f(context, 17),
                    weight: FontWeight.bold,
                  ),
                  Center(
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBlueColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              addToCart(1);
                            },
                            icon: const Icon(
                              Icons.add,
                              color: kSecondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

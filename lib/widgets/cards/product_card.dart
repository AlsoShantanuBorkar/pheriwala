import 'package:be_project/app_text_styles.dart';
import 'package:be_project/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          productModel.productName,
          style: AppTextStyles.lato20Black500,
        ),
        subtitle: Text(
          "Rs: ${productModel.price}",
          style: AppTextStyles.lato13Black400,
        ),
      ),
    );
  }
}

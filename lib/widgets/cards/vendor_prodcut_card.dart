import 'package:be_project/app_text_styles.dart';
import 'package:be_project/colors.dart';
import 'package:be_project/models/product_model.dart';
import 'package:be_project/providers/vendor_data_provider.dart';
import 'package:be_project/widgets/dialogs/edit_product_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VendorProductCard extends StatelessWidget {
  const VendorProductCard({super.key, required this.productModel});
  final ProductModel productModel;

  String clipString(String string) {
    if (string.length < 15) return string;
    String clippedString = "";
    for (int i = 0; i < 15; i++) {
      clippedString += string[i];
    }

    clippedString += "...";
    return clippedString;
  }

  @override
  Widget build(BuildContext context) {
    final VendorDataProvider vendorDataProvider =
        Provider.of<VendorDataProvider>(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Product ID :",
                  style: AppTextStyles.lato14Black400,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  productModel.productId.toString(),
                  style: AppTextStyles.lato20Black500,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Product Name :",
                  style: AppTextStyles.lato14Black400,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  clipString(productModel.productName.toString()),
                  style: AppTextStyles.lato20Black500,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Product Price :",
                  style: AppTextStyles.lato14Black400,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Rs: ${productModel.price.toString()}",
                  style: AppTextStyles.lato20Black500,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColorScheme.primary,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            EditProductDialog(productModel: productModel),
                      );
                    },
                    child: Text(
                      "Edit",
                      style: AppTextStyles.lato20White500,
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          icon: const Icon(
                            Icons.warning_outlined,
                            size: 50,
                            color: Colors.red,
                          ),
                          title: const Text("Confirm Deletion?"),
                          content: ListView(
                            shrinkWrap: true,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                onPressed: () async {
                                  await vendorDataProvider.removeProduct(
                                      name: productModel.productName);
                                },
                                child: Text(
                                  "Delete",
                                  style: AppTextStyles.lato20White500,
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColorScheme.primary,
                                ),
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Cancel",
                                  style: AppTextStyles.lato20White500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Delete",
                      style: AppTextStyles.lato20White500,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

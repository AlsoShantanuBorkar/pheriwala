import 'package:be_project/app_text_styles.dart';
import 'package:be_project/models/vendor_model.dart';
import 'package:be_project/screens/vendor_products.dart';
import 'package:flutter/material.dart';

class VendorCard extends StatelessWidget {
  const VendorCard({super.key, required this.vendorModel});

  final VendorModel vendorModel;

  String clipString(String string) {
    if (string.length < 17) return string;
    String clippedString = "";
    for (int i = 0; i < 17; i++) {
      clippedString += string[i];
    }

    clippedString += "...";
    return clippedString;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VendorProducts(
                vendorModel: vendorModel,
              ),
            ),
          );
        },
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade300,
          child: Image.network(
              "https://streetvendor-production.up.railway.app/vendor/download/${vendorModel.vendorname}"),
        ),
        title: Text(
          "Shop: ${clipString(vendorModel.shopname.toString())}",
          style: AppTextStyles.lato20Black500,
        ),
        subtitle: Text(
          "Contact: ${vendorModel.vendorcontact.toString()}",
          style: AppTextStyles.lato14Black400,
        ),
        trailing: Text(
          "${vendorModel.distancefromuser.toString()} m",
          style: AppTextStyles.lato12Black500,
        ),
      ),
    );
  }
}

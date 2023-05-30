import 'package:be_project/apis/api_routes.dart';
import 'package:be_project/app_text_styles.dart';
import 'package:be_project/colors.dart';
import 'package:be_project/models/vendor_model.dart';
import 'package:be_project/providers/map_utils.dart';
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  "${vendorRoute}download/${vendorModel.vendorname}",
                  fit: BoxFit.fill,
                  errorBuilder: (context, object, trace) {
                    return const CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.grey,
                    );
                  },
                ),
              ),
            ),
          ),
          title: Text(
            "Shop: ${clipString(vendorModel.shopname.toString())}",
            style: AppTextStyles.lato20Black500,
          ),
          subtitle: Text(
            "Contact: ${vendorModel.vendorcontact.toString()}",
            style: AppTextStyles.lato14Black400,
          ),
          trailing: TextButton.icon(
            onPressed: () {
              MapUtils.openMap(double.parse(vendorModel.latitude!),
                  double.parse(vendorModel.longitude!));
            },
            icon: const Icon(
              Icons.location_on_outlined,
              color: AppColorScheme.primary,
              size: 40,
            ),
            label: Text(
              "${vendorModel.distancefromuser.toString()} m",
              style: AppTextStyles.lato12Black500,
            ),
          )),
    );
  }
}

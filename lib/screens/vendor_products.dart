import 'package:be_project/apis/api_routes.dart';
import 'package:be_project/app_text_styles.dart';
import 'package:be_project/models/vendor_model.dart';
import 'package:be_project/providers/map_utils.dart';
import 'package:be_project/providers/vendor_data_provider.dart';
import 'package:be_project/widgets/custom/custom_app_bar.dart';
import 'package:be_project/widgets/cards/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VendorProducts extends StatefulWidget {
  const VendorProducts({super.key, required this.vendorModel});
  final VendorModel vendorModel;
  @override
  State<VendorProducts> createState() => _VendorProductsState();
}

class _VendorProductsState extends State<VendorProducts> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      VendorDataProvider vendorDataProvider =
          Provider.of<VendorDataProvider>(context, listen: false);
      vendorDataProvider.getProducts(widget.vendorModel.id!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final VendorDataProvider vendorDataProvider =
        Provider.of<VendorDataProvider>(context);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(title: "Vendor's Products"),
      ),
      body: vendorDataProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(children: [
                          CircleAvatar(
                            radius: 70,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Image(
                                  image: NetworkImage(
                                      "${vendorRoute}download/${widget.vendorModel.vendorname}"),
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
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Shopname : ",
                                    style: AppTextStyles.lato20Black500,
                                  ),
                                  Text(
                                    "Owner Name :",
                                    style: AppTextStyles.lato20Black500,
                                  ),
                                  Text(
                                    "Contact : ",
                                    style: AppTextStyles.lato20Black500,
                                  ),
                                  Text(
                                    "Location : ",
                                    style: AppTextStyles.lato20Black500,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.vendorModel.shopname!,
                                    style: AppTextStyles.lato20Black500,
                                  ),
                                  Text(
                                    widget.vendorModel.vendorname!,
                                    style: AppTextStyles.lato20Black500,
                                  ),
                                  Text(
                                    widget.vendorModel.vendorcontact!,
                                    style: AppTextStyles.lato20Black500,
                                  ),
                                  Text(
                                    widget.vendorModel.location!,
                                    style: AppTextStyles.lato20Black500,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () {
                                MapUtils.openMap(
                                    double.parse(widget.vendorModel.latitude!),
                                    double.parse(
                                        widget.vendorModel.longitude!));
                              },
                              child: Text(
                                "Open In Map",
                                style: AppTextStyles.lato20White500,
                              ))
                        ]),
                      ),
                    ),
                  ),
                  vendorDataProvider.products.isEmpty
                      ? Center(
                          child: Text(
                            "Vendor has no Products!\nTry Again Later",
                            style: AppTextStyles.lato20Black500,
                            textAlign: TextAlign.center,
                          ),
                        )
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(16),
                          itemCount: vendorDataProvider.products.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: ProductCard(
                                productModel:
                                    vendorDataProvider.products[index],
                              ),
                            );
                          },
                        ),
                ],
              ),
            ),
    );
  }
}

import 'package:be_project/app_text_styles.dart';
import 'package:be_project/providers/vendor_data_provider.dart';
import 'package:be_project/widgets/cards/vendor_prodcut_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LiveQueue extends StatefulWidget {
  const LiveQueue({super.key});

  @override
  State<LiveQueue> createState() => _LiveQueueState();
}

class _LiveQueueState extends State<LiveQueue> {
  @override
  Widget build(BuildContext context) {
    final VendorDataProvider vendorDataProvider =
        Provider.of<VendorDataProvider>(context);
    return vendorDataProvider.products.isEmpty
        ? Center(
            child: Text(
              "Welcome to Pheriwala!\n Add some Products!!",
              style: AppTextStyles.lato20Black500,
            ),
          )
        : ListView.builder(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            itemCount: vendorDataProvider.products.length,
            itemBuilder: (context, index) => VendorProductCard(
              productModel: vendorDataProvider.products[index],
            ),
          );
  }
}

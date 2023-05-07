import 'package:be_project/colors.dart';
import 'package:be_project/providers/vendor_data_provider.dart';
import 'package:be_project/widgets/dialogs/dialog_form_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddProductDialog extends StatelessWidget {
  AddProductDialog({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final VendorDataProvider vendorDataProvider =
        Provider.of<VendorDataProvider>(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: ListView(
        padding: const EdgeInsets.all(20),
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.fastfood,
                color: AppColorScheme.primary,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Add Product Details",
                style: GoogleFonts.dmSans(
                    fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          DialogFormField(
            textEditingController: nameController,
            hintText: "Potato .Onion, etc",
            iconData: Icons.indeterminate_check_box,
            dataType: "Product Name",
          ),
          const SizedBox(
            height: 20,
          ),
          DialogFormField(
            textEditingController: priceController,
            hintText: "Rs 150",
            iconData: Icons.currency_rupee,
            dataType: "Price",
            textInputType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                vendorDataProvider.addNewProduct(
                    name: nameController.text,
                    price: int.parse(priceController.text));
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: AppColorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Save Product",
                    style: GoogleFonts.dmSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.save,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

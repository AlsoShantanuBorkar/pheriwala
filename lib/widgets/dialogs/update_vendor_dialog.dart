import 'package:be_project/colors.dart';
import 'package:be_project/models/product_model.dart';
import 'package:be_project/models/vendor_model.dart';
import 'package:be_project/providers/location_provider.dart';
import 'package:be_project/providers/vendor_data_provider.dart';
import 'package:be_project/widgets/dialogs/dialog_form_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditVendorDialog extends StatefulWidget {
  const EditVendorDialog({super.key, required this.vendorModel});
  final VendorModel vendorModel;

  @override
  State<EditVendorDialog> createState() => _EditVendorDialogState();
}

class _EditVendorDialogState extends State<EditVendorDialog> {
  late final TextEditingController nameController;

  late final TextEditingController contactController;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.vendorModel.vendorname);
    contactController = TextEditingController(
        text: widget.vendorModel.vendorcontact.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final VendorDataProvider vendorDataProvider =
        Provider.of<VendorDataProvider>(context);
    final LocationProvider locationProvider =
        Provider.of<LocationProvider>(context);
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
                Icons.person_2_outlined,
                color: AppColorScheme.primary,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Edit User Details",
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
            hintText: "Ramesh Kumar",
            iconData: Icons.indeterminate_check_box,
            dataType: "Username",
          ),
          const SizedBox(
            height: 20,
          ),
          DialogFormField(
            textEditingController: contactController,
            hintText: "1234567890",
            iconData: Icons.phone,
            dataType: "Contact",
            textInputType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 60,
            child: ElevatedButton(
              onPressed: () async {
                await vendorDataProvider.updateVendor(widget.vendorModel.id!, {
                  "vendorusername": nameController.text,
                  "vendorcontact": contactController.text,
                  "location": vendorDataProvider.vendorModel.location
                }).then((value) => Navigator.pop(context));
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
                    "Update Details",
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

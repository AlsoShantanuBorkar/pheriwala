import 'dart:developer';

import 'package:be_project/widgets/custom/custom_app_bar.dart';
import 'package:be_project/widgets/custom/custom_icon_button.dart';
import 'dart:io';
import 'package:be_project/app_text_styles.dart';
import 'package:be_project/colors.dart';
import 'package:be_project/providers/vendor_data_provider.dart';
import 'package:be_project/screens/main_body.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class OnboardingProfileImage extends StatefulWidget {
  const OnboardingProfileImage({
    super.key,
  });

  @override
  State<OnboardingProfileImage> createState() => _OnboardingProfileImageState();
}

class _OnboardingProfileImageState extends State<OnboardingProfileImage> {
  final ImagePicker picker = ImagePicker();
  final FilePicker filePicker = FilePicker.platform;
  XFile? image;

  Future pickImage(BuildContext context) async {
    try {
      final image = await filePicker.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        allowedExtensions: ['png'],
      );

      if (image == null) return;

      final imageTemp = XFile(image.paths[0]!);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final VendorDataProvider vendorDataProvider =
        Provider.of<VendorDataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Image"),
        backgroundColor: AppColorScheme.primary,
      ),
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: image == null
                    ? Center(
                        child: Text(
                          "Preview Image",
                          style: GoogleFonts.dmSans(
                            fontSize: 20,
                            color: AppColorScheme.textGrey,
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.file(
                          File(image!.path),
                          fit: BoxFit.fill,
                        ),
                      ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomIconButton(
                  onPressed: () {
                    pickImage(context);
                  },
                  buttonText: "Upload Image",
                  backgroundColor: AppColorScheme.primaryVariant,
                  buttonTextStyle: GoogleFonts.dmSans(
                      fontSize: 22, color: AppColorScheme.primary),
                  suffixIcon: const Icon(
                    Icons.folder_open,
                    color: AppColorScheme.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomIconButton(
                  onPressed: () async {
                    if (image != null) {
                      await vendorDataProvider.uploadImage(image!).then(
                            (value) => vendorDataProvider.isLoggedin
                                ? Navigator.pop(context)
                                : showDialog(
                                    context: context,
                                    builder: (context) => const AlertDialog(
                                      icon: Icon(
                                        Icons.warning_outlined,
                                        color: Colors.red,
                                        size: 50,
                                      ),
                                      title: Text("Error Occured"),
                                    ),
                                  ),
                          );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          icon: const Icon(
                            Icons.warning,
                            color: Colors.red,
                            size: 50,
                          ),
                          title: Text(
                            "Please Select A Profile Image",
                            style: AppTextStyles.lato20Black500,
                          ),
                        ),
                      );
                    }
                  },
                  buttonText: "Finish SignUp",
                  backgroundColor: AppColorScheme.primary,
                  buttonTextStyle:
                      GoogleFonts.dmSans(fontSize: 22, color: Colors.white),
                  suffixIcon: const Icon(
                    Icons.check_circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

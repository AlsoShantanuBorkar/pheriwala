import 'package:be_project/app_text_styles.dart';
import 'package:be_project/colors.dart';
import 'package:be_project/providers/vendor_data_provider.dart';
import 'package:be_project/screens/auth/onboarding/onboarding_profile_image.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnboardingShop extends StatefulWidget {
  const OnboardingShop({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<OnboardingShop> createState() => _OnboardingShopState();
}

class _OnboardingShopState extends State<OnboardingShop> {
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController shopLocationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final VendorDataProvider vendorDataProvider =
        Provider.of<VendorDataProvider>(context);

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16,
              ),
              child: Column(
                children: [
                  Text(
                    "Welcome To Pheriwala",
                    style: AppTextStyles.lato20Black500,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Connecting Street Vendors and Customers",
                    style: AppTextStyles.lato20Black500,
                  ),
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              "What’s your Storename ?",
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: TextField(
              onChanged: (value) {
                shopNameController.text = value;
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                hintText: "John's Tea Shop",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              "Where is this store located ?",
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: TextField(
              onChanged: (value) => shopLocationController.text = value,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.location_on,
                  color: Colors.black,
                ),
                suffixIcon: IconButton(
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(
                    Icons.my_location,
                    color: AppColorScheme.primary,
                  ),
                  onPressed: () {},
                ),
                hintText: "Westside ,Santacruz",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color.fromRGBO(0, 114, 109, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                ),
                onPressed: () async {
                  widget.data["shopname"] = shopNameController.text;
                  widget.data["location"] = shopLocationController.text;

                  await vendorDataProvider
                      .authenticateUser(isLogin: false, data: widget.data)
                      .then(
                        (value) => vendorDataProvider.isLoggedin
                            ? {
                                Navigator.popUntil(
                                    context, (route) => route.isFirst),
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const OnboardingProfileImage(),
                                  ),
                                )
                              }
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
                },
                child: Text(
                  "Continue",
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

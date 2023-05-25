// ignore_for_file: unused_local_variable

import 'package:be_project/app_text_styles.dart';
import 'package:be_project/images.dart';
import 'package:be_project/main.dart';
import 'package:be_project/providers/location_provider.dart';
import 'package:be_project/providers/user_data_provider.dart';
import 'package:be_project/providers/vendor_data_provider.dart';
import 'package:be_project/screens/auth/onboarding/onboarding_shop.dart';
import 'package:be_project/screens/nearby_vendor.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  bool isVendor = true;

  @override
  Widget build(BuildContext context) {
    final VendorDataProvider vendorDataProvider =
        Provider.of<VendorDataProvider>(context);
    final UserDataProvider userDataProvider =
        Provider.of<UserDataProvider>(context);
    final LocationProvider locationProvider =
        Provider.of<LocationProvider>(context);
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();

    return Scaffold(
      body: Form(
        key: _key,
        child: ListView(
          children: [
            Image.asset(ImagePNG.pheriwala_hero),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16,
              ),
              child: Text(
                "Create My Account",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  color: AppColorScheme.primaryVariant,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "User",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Switch(
                      value: isVendor,
                      onChanged: (state) {
                        setState(() {
                          isVendor = state;
                        });
                      },
                      activeColor: AppColorScheme.primary,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Vendor",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Text(
                "Mobile Number",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
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
              child: TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null) {
                    return "Please Enter Your Number";
                  } else if (value.length != 10) {
                    return "Enter Valid Phone Number";
                  } else {
                    phoneNumberController.text = value;
                    return null;
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: Colors.black,
                  ),
                  hintText: "881 - 882 - 21831",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Text(
                "Username",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
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
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter A Valid Name ";
                  } else {
                    userNameController.text = value;
                    return null;
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.person_outline,
                    color: Colors.black,
                  ),
                  hintText: "John Doe",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Text(
                "Enter Password",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
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
              child: TextFormField(
                obscureText: true,
                obscuringCharacter: "*",
                validator: (value) {
                  if (value!.length < 8) {
                    return "Password Length Must be Greater than 8";
                  } else {
                    passwordController.text = value;
                    return null;
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Colors.black,
                  ),
                  hintText: "********",
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
                    if (_key.currentState!.validate()) {
                      if (!isVendor) {
                        await userDataProvider.authenticateUser(
                          data: {
                            "usercontact": phoneNumberController.text,
                            "username": userNameController.text,
                            "password": passwordController.text,
                            "latitude":
                                locationProvider.currentPosition["latitude"],
                            "longitude":
                                locationProvider.currentPosition["longitude"],
                            "notificationToken": token
                          },
                        ).then(
                          (value) {
                            userDataProvider.isLoggedin
                                ? Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const NearbyVendors(),
                                    ),
                                  )
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
                                  );
                          },
                        );
                      } else {
                        Map<String, dynamic> data = {
                          "vendorcontact": phoneNumberController.text,
                          "vendorname": userNameController.text,
                          "password": passwordController.text,
                          "shopname": "",
                          "location": "",
                          "latitude": locationProvider
                              .currentPosition["latitude"]
                              .toString(),
                          "longitude": locationProvider
                              .currentPosition["longitude"]
                              .toString(),
                          "notificationToken": token
                        };
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OnboardingShop(
                              data: data,
                            ),
                          ),
                        );
                      }
                    }
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
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

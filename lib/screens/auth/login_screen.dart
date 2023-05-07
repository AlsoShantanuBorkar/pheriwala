// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:be_project/app_text_styles.dart';
import 'package:be_project/colors.dart';
import 'package:be_project/providers/location_provider.dart';
import 'package:be_project/providers/user_data_provider.dart';
import 'package:be_project/providers/vendor_data_provider.dart';
import 'package:be_project/screens/auth/sign_up.dart';
import 'package:be_project/screens/main_body.dart';
import 'package:be_project/screens/nearby_vendor.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

    return Scaffold(
      body: userDataProvider.isLoading || vendorDataProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _key,
              child: ListView(
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
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
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
                  const SizedBox(
                    height: 16,
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
                      "Password",
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
                        if (value!.isEmpty) {
                          return "Enter Valid Password";
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
                              await userDataProvider.authenticateUser(data: {
                                "username": userNameController.text,
                                "password": passwordController.text
                              }, isLogin: true).then(
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
                                          builder: (context) =>
                                              const AlertDialog(
                                                icon: Icon(
                                                  Icons.warning_outlined,
                                                  color: Colors.red,
                                                  size: 50,
                                                ),
                                                title: Text("Error Occured"),
                                              ));
                                },
                              );
                            } else {
                              log({
                                "username": userNameController.text,
                                "password": passwordController.text
                              }.toString());
                              await vendorDataProvider.authenticateUser(data: {
                                "username": userNameController.text,
                                "password": passwordController.text
                              }, isLogin: true).then(
                                (value) {
                                  vendorDataProvider.isLoggedin
                                      ? Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const MainBody(),
                                          ),
                                        )
                                      : showDialog(
                                          context: context,
                                          builder: (context) =>
                                              const AlertDialog(
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
                            }
                          }
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.dmSans(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Don't Have An Account? Signup",
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

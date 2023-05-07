// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'dart:async';
import 'dart:developer';

import 'package:be_project/app_text_styles.dart';
import 'package:be_project/main.dart';
import 'package:be_project/models/user_model.dart';
import 'package:be_project/models/vendor_model.dart';
import 'package:be_project/providers/location_provider.dart';
import 'package:be_project/providers/user_data_provider.dart';
import 'package:be_project/providers/vendor_data_provider.dart';
import 'package:be_project/screens/auth/login_screen.dart';
import 'package:be_project/screens/main_body.dart';
import 'package:be_project/screens/nearby_vendor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      // tick);
      if (timer.tick > 5) checkUserLog();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    // ! DO NOT Remove, Required for fetching data from DB
    final UserDataProvider userDataProvider =
        Provider.of<UserDataProvider>(context);
    final VendorDataProvider cartStateProvider =
        Provider.of<VendorDataProvider>(context);
    final LocationProvider locationProvider =
        Provider.of<LocationProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(),
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/pheriwala.jpg",
                width: 200,
                height: 200,
              ),
              Text(
                "Pheriwala",
                style:
                    AppTextStyles.lato14Black500Italic.copyWith(fontSize: 20),
              ),
              Text(
                "Connecting Street Vendors and Customers!",
                style:
                    AppTextStyles.lato14Black500Italic.copyWith(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkUserLog() async {
    try {
      bool found = false;
      SharedPreferences.getInstance().then(
        (value) async {
          SharedPreferences sharedPreferencesInstance = value;

          int? userID = sharedPreferencesInstance.getInt('userAuthID');

          if (userID != null) {
            await isarInstance.userModels.get(userID).then(
              (value) {
                UserModel? userModel = value;
                if (userModel != null) {
                  if (timer.isActive) timer.cancel();
                  log('// PUSHING NEarby Vendors');
                  found = true;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NearbyVendors(),
                    ),
                  );
                }
              },
            );
          }
          if (found) {
            return;
          }
          int? vendorID = sharedPreferencesInstance.getInt("vendorAuthID");
          log("VENDOR ID");

          if (vendorID != null) {
            log("VENDOR ID FOUND");
            await isarInstance.vendorModels.get(vendorID).then(
              (value) {
                VendorModel? vendorModel = value;
                if (vendorModel != null) {
                  if (timer.isActive) timer.cancel();
                  log("// pushReplacementing LiveQUEUE Page");
                  found = true;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainBody(),
                    ),
                  );
                  return;
                }
              },
            );
          }
          if (found) {
            return;
          }
          if (timer.isActive) timer.cancel();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        },
      );
    } catch (e) {
      log("$e");
    }
  }

  changePage({required context, required page, isReplacement = false}) {
    return isReplacement
        ? Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => page), (route) => false)
        : Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
  }
}

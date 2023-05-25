import 'package:be_project/app_text_styles.dart';
import 'package:be_project/colors.dart';
import 'package:be_project/providers/location_provider.dart';
import 'package:be_project/providers/vendor_data_provider.dart';
import 'package:be_project/screens/auth/login_screen.dart';
import 'package:be_project/screens/auth/onboarding/onboarding_profile_image.dart';
import 'package:be_project/screens/live_queue.dart';
import 'package:be_project/screens/vendor_profile.dart';
import 'package:be_project/widgets/custom/custom_app_bar.dart';
import 'package:be_project/widgets/new_product_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      VendorDataProvider vendorDataProvider =
          Provider.of<VendorDataProvider>(context, listen: false);
      vendorDataProvider.getProducts(vendorDataProvider.vendorModel.id!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final VendorDataProvider vendorDataProvider =
        Provider.of<VendorDataProvider>(context);
    final LocationProvider locationProvider =
        Provider.of<LocationProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: CustomAppBar(
          actions: [
            IconButton(
              onPressed: () async {
                await vendorDataProvider.notifyUsers().then((value) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      icon: const Icon(
                        Icons.check_circle_outline,
                        size: 50,
                        color: AppColorScheme.primary,
                      ),
                      title: Text(
                        "Users Notified!",
                        style: AppTextStyles.lato20Black500,
                      ),
                    ),
                  );
                });
              },
              icon: const Icon(
                Icons.notifications_outlined,
                color: AppColorScheme.primary,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AddProductDialog();
                  },
                );
              },
              icon: const Icon(
                Icons.add,
                color: AppColorScheme.primary,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () async {
                await vendorDataProvider
                    .updateLocation(locationProvider.currentPosition)
                    .then((value) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      icon: const Icon(
                        Icons.check_circle_outline,
                        size: 50,
                        color: AppColorScheme.primary,
                      ),
                      title: Text(
                        "Location Updated Successfully",
                        style: AppTextStyles.lato20Black500,
                      ),
                    ),
                  );
                });
              },
              icon: const Icon(
                Icons.location_on_outlined,
                color: AppColorScheme.primary,
                size: 30,
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()));
                },
                icon: const Icon(
                  Icons.person_2_outlined,
                  color: AppColorScheme.primary,
                  size: 30,
                )),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    icon: const Icon(
                      Icons.warning_outlined,
                      size: 50,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Confirm Logout?",
                      style: AppTextStyles.lato20Black500,
                    ),
                    content: SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () {
                              vendorDataProvider.logout();
                              Navigator.popUntil(
                                  context, (route) => route.isFirst);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Confirm Logout",
                              style: AppTextStyles.lato20White500,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColorScheme.primary,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: AppTextStyles.lato20White500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.logout_outlined,
                color: Colors.red,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      endDrawer: const Drawer(),
      body: vendorDataProvider.isLoading
          ? Container()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Theme(
                data: ThemeData(
                  colorScheme: ColorScheme.fromSwatch(
                    accentColor: AppColorScheme
                        .primary, // but now it should be declared like this
                  ),
                ),
                child: const LiveQueue(),
              ),
            ),
    );
  }
}

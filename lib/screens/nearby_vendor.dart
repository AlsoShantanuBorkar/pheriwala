import 'package:be_project/app_text_styles.dart';
import 'package:be_project/colors.dart';
import 'package:be_project/providers/location_provider.dart';
import 'package:be_project/providers/user_data_provider.dart';
import 'package:be_project/providers/vendor_data_provider.dart';
import 'package:be_project/screens/auth/login_screen.dart';
import 'package:be_project/screens/search_vendor.dart';
import 'package:be_project/widgets/custom/custom_app_bar.dart';
import 'package:be_project/widgets/cards/vendor_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NearbyVendors extends StatefulWidget {
  const NearbyVendors({super.key});

  @override
  State<NearbyVendors> createState() => _NearbyVendorsState();
}

class _NearbyVendorsState extends State<NearbyVendors> {
  @override
  Widget build(BuildContext context) {
    final UserDataProvider userDataProvider =
        Provider.of<UserDataProvider>(context);
    final VendorDataProvider vendorDataProvider =
        Provider.of<VendorDataProvider>(context);
    final LocationProvider locationProvider =
        Provider.of<LocationProvider>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          actions: [
            IconButton(
              onPressed: () async {
                await userDataProvider
                    .updateLocation(locationProvider.currentPosition)
                    .then(
                  (value) {
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
                  },
                );
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
                    builder: (context) => SearchVendorScreem(
                      userDataProvider: userDataProvider,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
                color: AppColorScheme.primary,
                size: 30,
              ),
            ),
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
                              userDataProvider.logout();
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
      body: vendorDataProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: userDataProvider.vendors.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child:
                      VendorCard(vendorModel: userDataProvider.vendors[index]),
                );
              }),
    );
  }
}

import 'package:be_project/app_text_styles.dart';
import 'package:be_project/colors.dart';
import 'package:be_project/providers/vendor_data_provider.dart';
import 'package:be_project/screens/auth/onboarding/onboarding_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String placeHolder = "https://placehold.co/600x400";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: AppColorScheme.primary,
      ),
      body: Consumer<VendorDataProvider>(builder: (context, value, child) {
        return ListView(
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          children: [
            CircleAvatar(
              radius: 70,
              child: Image.network(
                "https://average-leg-production.up.railway.app/vendor/download/${value.vendorModel.vendorname}",
                errorBuilder: (context, object, trace) {
                  return const CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.grey,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColorScheme.primary,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnboardingProfileImage(),
                    ),
                  );
                },
                child: Text(
                  "Upload Photo",
                  style: AppTextStyles.lato20White500,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                "Username: ${value.vendorModel.vendorname!}",
                style: AppTextStyles.lato20Black500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                "Contact: ${value.vendorModel.vendorcontact!}",
                style: AppTextStyles.lato20Black500,
              ),
            ),
          ],
        );
      }),
    );
  }
}

import 'package:be_project/colors.dart';
import 'package:be_project/images.dart';
import 'package:be_project/widgets/custom/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthProgressIndicator extends StatelessWidget {
  const AuthProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            prefixIcon: const Icon(
              Icons.chevron_left,
              color: AppColorScheme.primary,
            ),
            height: 40,
            buttonText: "Back",
            backgroundColor: Colors.transparent,
            buttonTextStyle: GoogleFonts.dmSans(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                ImageSVG.loginProgressIndicatorFilled,
                width: 20,
                height: 7,
              ),
              const SizedBox(
                width: 5,
              ),
              SvgPicture.asset(
                ImageSVG.loginProgressIndicatorFilled,
                width: 20,
                height: 7,
              ),
              const SizedBox(
                width: 5,
              ),
              SvgPicture.asset(
                ImageSVG.loginProgressIndicatorFilled,
                width: 20,
                height: 7,
              ),
              const SizedBox(
                width: 5,
              ),
              SvgPicture.asset(
                ImageSVG.loginProgressIndicatorFilled,
                width: 20,
                height: 7,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

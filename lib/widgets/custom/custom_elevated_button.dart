import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.backgroundColor, required this.buttonText});
  final Color backgroundColor;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
        ),
        onPressed: () {},
        child: Text(
          buttonText,
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

import 'package:be_project/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogFormField extends StatelessWidget {
  const DialogFormField(
      {super.key,
      required this.hintText,
      required this.iconData,
      required this.dataType,
      required this.textEditingController,
      this.textInputType = TextInputType.text});
  final TextEditingController textEditingController;
  final String hintText;
  final IconData iconData;
  final String dataType;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  color: AppColorScheme.primary,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  dataType,
                  style: GoogleFonts.dmSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: AppColorScheme.primary, width: 1),
              ),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:be_project/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.title = "Pheriwala",
    this.actions,
  });

  final String title;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      backgroundColor: Colors.white,
      elevation: 0,
      leadingWidth: 24,
      titleSpacing: 10,
      shape: const Border(
        bottom: BorderSide(color: Colors.black, width: .5),
      ),
      title: Text(
        title,
        style: GoogleFonts.doHyeon(color: AppColorScheme.primary, fontSize: 25),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    super.key,
    required this.buttonText,
    required this.backgroundColor,
    required this.buttonTextStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.width,
    this.height,
    this.onPressed,
  });
  final String buttonText;
  final double? width;
  final double? height;
  Icon? suffixIcon;
  Icon? prefixIcon;
  final Color backgroundColor;
  Function? onPressed;

  final TextStyle buttonTextStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      child: Container(
        width: width ?? 140,
        height: height ?? 60,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: buttonTextStyle,
            )
          ],
        ),
      ),
    );
  }
}

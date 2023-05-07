import 'package:be_project/colors.dart';
import 'package:be_project/widgets/new_product_dialog.dart';
import 'package:flutter/material.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddProductDialog();
            },
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: const CircleBorder(),
          backgroundColor: AppColorScheme.primary,
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

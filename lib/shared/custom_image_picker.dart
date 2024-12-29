import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../constants/app_styles.dart';
import '../constants/colors.dart';
import '../controller/products/products_controller.dart';
class CustomImagePicker extends StatelessWidget {
  const CustomImagePicker({
    super.key,
    required this.addProductController,
  });

  final ProductController addProductController;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      color: Colors.black,
      dashPattern: const [11, 6],
      strokeWidth: 1,
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        width: 200,
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image,
              color: headerColor,
            ),
            const SizedBox(width: 8.0,),
            InkWell(
              onTap: () async {
                await addProductController.pickImage();

              },
              child: Text(
                "Pick product image",
                style: navBarItemStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
